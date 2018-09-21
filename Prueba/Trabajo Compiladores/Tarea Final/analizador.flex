import java_cup.runtime.Symbol;
%%
%cup

variable=[A-Z]
digito=[0-9]+
string="\""~"\""
enter=[\n]

%%

"=" {return new Symbol(sym.IGUAL);}
"+" {return new Symbol(sym.MAS);}
"-" {return new Symbol(sym.MENOS);}
"*" {return new Symbol(sym.POR);}
"/" {return new Symbol(sym.DIV);}
"<" {return new Symbol(sym.MENOR);}
">" {return new Symbol(sym.MAYOR);}
"(" { return new Symbol(sym.PARA);}
")" { return new Symbol(sym.PARC);}
"comienzo" {return new Symbol(sym.COMIENZO);}
"fin" { return new Symbol(sym.FIN);}
"salida" {return new Symbol(sym.SALIDA);}
"entrada" {return new Symbol(sym.ENTRADA);}
"if" {return new Symbol(sym.IF);}
"then" {return new Symbol(sym.THEN);}

{variable} {return new Symbol(sym.LETRA, new String(yytext()));}
{digito} {return new Symbol(sym.DIGITO, new Integer(yytext()));}
{enter} {return new Symbol(sym.ENTER);}
{string} {return new Symbol(sym.ESTRING, new String(yytext()));}

[\t\r\f ] { /* ignore white space. */ }

. { System.err.println("Illegal character: "+yytext()); }