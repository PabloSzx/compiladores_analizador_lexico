package lexical_analyzer;
import java.util.Scanner;
import java.io.*;
%%

%class Code
%unicode
%type String

%{
public static void main(String[] args) throws IOException {
    Reader br = new FileReader("../test.txt");
    Code example = new Code(br);
    String lectura;
    do {
        lectura = example.yylex();
        System.out.println("lectura: " + lectura);
    } while(lectura != "fin");
    br.close();


}

%}
FIN = (";")
ESPACIO = (" ")
PALABRA = ([:letter:])+
NUMERO = ([:digit:])+
FELIZ=("😁")
SMILE=("😄")



INST = {INST} | {INST_IF} | {INST_WHILE} | {INST_FOR}
INST_IF = "if"{C1}"then"{INST}
ID = ({PALABRA} | {PALABRA} {NUMERO})+
ASIG = {ID}"="{EXP}
C1 = ({EXP}{OP}{EXP})+
EXP = {EXP}*{EXP} | {EXP}/{EXP} | {EXP}+{EXP} | {EXP}-{EXP} | {ID} | {NUMERO}
OP = ("=="|"<"|">"|"¬"|"!"|"<>"|"<="|">=")
INST_WHILE = ("while"|"WHILE"){C1}"then "{INST}
INST_FOR = ("for"|"FOR"){ASIG}{C1}{ASIG}


%%

{FELIZ} {System.out.println("CARA FELIZ!"); return "happy";}
{ESPACIO}   { System.out.println("Espacio!"); return "espacio"; }
{PALABRA}   { System.out.println("Palabra!" + this.yytext()); return "a"; }
{NUMERO} { System.out.println("Numero!"); return "b"; }
{FIN} { System.out.println("Gracias!"); return "fin"; }
{SMILE} { System.out.println("SMILE!"); return "smile"; }