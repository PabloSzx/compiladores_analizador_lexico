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
        System.out.println(lectura);
    } while(lectura != null);
    br.close();


}

%}
PALABRA = ([:letter:])+
NUMERO = ([:digit:])+|(([:digit:])+(".")([:digit:])+)
STRING = ("\""){PALABRA}("\"")
ESPACIO = ((" ")+|("\n"))
IDENTIFICADOR = (({NUMERO})+({PALABRA})+)
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