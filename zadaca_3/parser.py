# IDEJA
# 1. Iz asemblerske datoteke izbaciti sve razmake i komentare. Sjetite
#    se kako komentari u hack asembleru mogu biti jednolinijski i
#    viselinijski.
# 2. Sve simbole i varijable pretvoriti u numericke adrese (brojevi
#    linija ili adrese u memoriji).
# 3. Parsirati naredbe (A i C-instrukcije).

class Parser:
    from parseLines import _parse_lines, _parse_line
    from parseComms import _parse_commands, _parse_command, _init_comms
    from parseSymbs import _parse_symbols, _parse_labels, _parse_variables, _init_symbols
    
    def __init__(self, filename):
        # Otvaramo input asemblersku datoteku.
        try:
            self._file = open(filename + ".asm", "r")
        except:
            Parser._error("File", -1, "Cannot open source file")
            return

        # Linije iz input datoteke upisujuemo u ovu listu.
        self._lines = []
        
        # Citamo input datoteku.
        try:
            self._read_lines()
        except:
            Parser._error("File", -1, "Cannot read source file.")
            return

        # Pogreske prilikom parsiranja.
        self._flag = True # Ukoliko je flag postavljen na False, parsiranje je neuspjesno.
        self._line = -1   # lokacija (broj linije) na kojoj se pogreska nalazi.
        self._errm = ""   # Poruka koja opisuje pogresku.

        # Parsiramo linije izvornog koda.
        self._parse_lines()
        if self._flag == False:
            Parser._error("PL", self._line, self._errm)
            return
        
        # oznake
        self._labels = {}
        self._variables = {}
        
        self._parse_symbols()
        if self._flag == False:
            Parser._error("SYM", self._line, self._errm)
            return
            
        self._parse_commands()
        if self._flag == False:
            Parser._error("COM", self._line, self._errm)
            return
            
        # Na kraju parsiranja strojni kod upisujemo u ".hack" datoteku.
        try:
            self._outfile = open(filename + ".hack", "w")
        except:
            Parser._error("File", -1, "Cannot open output file")
            return

        try:
            self._write_file()
        except:
            Parser._error("File", -1, "Cannot write to output file")
            return          

    # Funkcija koja cita input datoteku te svaki redak sprema u listu uredjenih
    # trojki kojima su koordinate
    #   1. originalna linija iz datoteke
    #   2. broj linije u parsiranoj datoteci (u pocetku isti kao 3.)
    #   3. broj linije u originalnoj datoteci
    def _read_lines(self):
        n = 0
        wc = 0
        wl = []
        for line in self._file:
            if(line[0]=="$" and line[1:6]!="WHILE" and line[1:4] != "END"):
                li=[]
                a1=line.split("$")[1]
                a=a1.split("(")[0]
                b=a1.split("(")[1]
                c=b.split(")")[0]
                d=c.split(",")
                if a=="MV":
                    A=d[0]
                    B=d[1]
                    li.append(f"@{A}\n")
                    li.append("D=M\n")
                    li.append(f"@{B}\n")
                    li.append("M=D\n")
                elif a=="SWP":
                    A=d[0]
                    B=d[1]
                    li.append(f"@{A}\n")
                    li.append("D=M\n")
                    li.append("@3000\n")
                    li.append("M=D\n")
                    li.append(f"@{B}\n")
                    li.append("D=M\n")
                    li.append(f"@{A}\n")
                    li.append("M=D\n")
                    li.append("@3000\n")
                    li.append("D=M\n")
                    li.append(f"@{B}\n")
                    li.append("M=D\n")
                elif a=="SUM":
                    A=d[0]
                    B=d[1]
                    D=d[2]
                    li.append(f"@{A}\n")
                    li.append("D=M\n")
                    li.append(f"@{D}\n")
                    li.append("M=D\n")
                    li.append(f"@{B}\n")
                    li.append("D=M\n")
                    li.append(f"@{D}\n")
                    li.append("M=M+D\n")
                for i in li:
                    self._lines.append((i, n, n));
                    n += 1
            elif(line[0]=="$" and line[1:6]=="WHILE" and line[1:4] != "END"):
                wc+=1
                wl.append(wc)
                b=line.split("(")[1]
                c=b.split(")")[0]
                li=[]
                li.append(f"(LOOP{wc}_START)\n")
                li.append(f"@{c}\n")
                li.append("D=M\n")
                li.append(f"@LOOP{wc}_END\n")
                li.append("D;JEQ\n")
                for i in li:
                    self._lines.append((i, n, n));
                    n += 1
            elif (line[0]=="$" and line[1:4] == "END"):
                abc=wl.pop()
                li=[]
                li.append(f"@LOOP{abc}_START\n")
                li.append("0;JMP\n")
                li.append(f"(LOOP{abc}_END)\n")
                for i in li:
                    self._lines.append((i, n, n));
                    n += 1
            else:
                self._lines.append((line, n, n));
                n += 1
        
    # Funkcija upisuje parsirane linije u output ".hack" datoteku.
    def _write_file(self):
        for (line, p, o) in self._lines:
            self._outfile.write(line)
            if (line[-1] != "\n"):
                self._outfile.write("\n")

    # Funkcija iterira procitanim linijama i na svaku primjenjuje funkciju
    # "func". Funkcija "func" vraća string koji odgovara vrijednosti parsirane
    # linije.
    #
    # Primjer:
    # ("@END", 4, 4) postaje ("@3", 3, 4)
    #
    # Ukoliko je duljina vracene linije 0, tu liniju brisemo. Takodjer, svaka
    # funkcija "func" mora se brinuti o pogreskama na koje moze naici (npr.
    # viselinijski komentari koji nisu zatvoreni ili pogresna naredba M=B+1).
    def _iter_lines(self, func):
        newlines = []
        i = 0
        for (line, p, o) in self._lines:
            newline = func(line, i, o)
            if (self._flag == False):
                break
            if (len(newline) > 0):
                newlines.append((newline, i, o))
                i += 1
        self._lines = newlines
        
    @staticmethod
    def _error(src, line, msg):
        if len(src) > 0 and line > -1:
            print("[" + src + ", " + str(line) + "] " + msg)
        elif len(src) > 0:
            print("[" + src + "] " + msg)
        else:
            print(msg)  


if __name__ == "__main__":
    Parser("test-z2d")


#li=self.replacemacro(line)
#for i in li:
#    self._lines.append((i, n, n));
#    n += 1