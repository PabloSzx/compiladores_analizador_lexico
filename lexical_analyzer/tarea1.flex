package lexical_analyzer;
import java.util.Scanner;
import java.io.*;
%%

%class tarea1
%unicode
%type String

%{
private int i;
private Hashtable<String, int> map;
public static void main(String[] args) throws IOException {
    Reader br = new FileReader("../test.txt");
    tarea1 example = new tarea1(br);
    String lectura;
    do {
        lectura = example.yylex();
        System.out.println(lectura);
    } while(lectura != null);
    br.close();


}

%}

%init{
  this.i = 0;
  this.map = new Hashtable<String, int>();
} 
PALABRA = ([:letter:])+
NUMERO = ([:digit:])+|(([:digit:])+(".")([:digit:])+)
STRING = ("\""){PALABRA}("\"")
ESPACIO = ((" ")+|("\n")|("\t"))
IDENTIFICADOR = ({NUMERO})+({PALABRA})+ | ({PALABRA})+({NUMERO})+ 
BOOLEAN= ("👍"|"👎")
INSTRUCCION=("🤔"|"♻"|"🌀")
ASIGNACION = ("=")
THEN=("➡"️)
PUNTUACION=("("|")")
COMPARADOR=(">"|"<"|"=="|"!"|"!="|"<="|">=")
OPERADOR=("⬆"|"⬇️")
TIPO = ("entero"|"palabra"|"caracter"|"flotante"|"booleano")

%%
{NUMERO} {return ("[NUMERO," + this.yytext() + "]");}
{STRING} {return ("[STRING," + this.yytext() + "]");}
{TIPO} {return ("[TIPO, " + this.yytext() + "]");}
{IDENTIFICADOR} {return ("[IDENTIFICADOR," + this.yytext() + "]");}
{INSTRUCCION} {return ("[INSTRUCCION," + this.yytext() + "]");}
{BOOLEAN} {return ("[BOOLEAN," + this.yytext() + "]");}
{PUNTUACION} {return ("[PUNTUACION," + this.yytext() + "]");}
{COMPARADOR} {return ("[COMPARADOR," + this.yytext() + "]");}
{OPERADOR} {return ("[OPERADOR," + this.yytext() + "]");}
{ASIGNACION} {return ("[ASIGNACION, ]");}
{THEN} {return ("[THEN, ]");}
{ESPACIO} {return ("[ESPACIOS, ]");}
