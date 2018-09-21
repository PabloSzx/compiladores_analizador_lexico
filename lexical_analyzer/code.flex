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
%%

{ESPACIO}   { System.out.println("Espacio!"); return "espacio"; }
{PALABRA}   { System.out.println("Palabra!" + this.yytext()); return "a"; }
{NUMERO} { System.out.println("Numero!"); return "b"; }
{FIN} { System.out.println("Gracias!"); return "fin"; }