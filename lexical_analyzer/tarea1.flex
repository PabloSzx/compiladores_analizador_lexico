package lexical_analyzer;
import java.util.*;
import java.io.*;
import javafx.util.Pair;
%%

%class tarea1
%unicode
%type String


%init{
  this.i = 0;
  this.map = new Hashtable<String, Pair<String, Integer>>();
%init} 

%{
private int i;
private Hashtable<String, Pair<String, Integer>> map;

public void printMemory() {
    for(Map.Entry<String, Pair<String, Integer>> entry:this.map.entrySet()){    
        String nombre=entry.getKey(); 
        String tipo=entry.getValue().getKey();
        int n = entry.getValue().getValue();

        System.out.println(n + " | " + tipo + ", " + nombre);
    }    
}

private int get(boolean id) {
    int aux;
    if (this.map.containsKey(this.yytext())) {
        aux = this.map.get(this.yytext()).getValue();
    } else {
        this.map.put(this.yytext(), new Pair<String, Integer>(id ? "ID" : "CONST", ++this.i));
        aux = this.i;
    }
    return aux;
}

public static void main(String[] args) throws IOException {
    Reader br = new FileReader("../test.txt");
    tarea1 example = new tarea1(br);
    String lectura;
    do {
        lectura = example.yylex();
        if (lectura != null && lectura != "[ESPACIOS, ]") {
            System.out.println(lectura);
        }
    } while(lectura != null);
    br.close();

    example.printMemory();

}

%}

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
{NUMERO} {return ("[CONST, " + this.get(false) + "]");}
{STRING} {return ("[STRING, " + this.yytext() + "]");}
{TIPO} {return ("[TIPO, " + this.yytext() + "]");}
{IDENTIFICADOR} {return ("[ID, " + this.get(true) + "]");}
{INSTRUCCION} {return ("[INSTRUCCION, " + this.yytext() + "]");}
{BOOLEAN} {return ("[BOOLEAN, " + this.yytext() + "]");}
{PUNTUACION} {return ("[PUNTUACION, " + this.yytext() + "]");}
{COMPARADOR} {return ("[COMPARADOR, " + this.yytext() + "]");}
{OPERADOR} {return ("[OPERADOR, " + this.yytext() + "]");}
{ASIGNACION} {return ("[ASIGNACION, =]");}
{THEN} {return ("[THEN, "+ this.yytext() +"]");}
{ESPACIO} {return ("[ESPACIOS, ]");}
