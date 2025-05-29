package com.mycompany.compiladores;

import java_cup.runtime.*;

%%

// Opciones y declaraciones
%class AnalizadorLexico
%public
%cup
%char
%line
%column

%{

// Método para imprimir información del token encontrado
public void imprimirToken(String descripcion, String lexema, int linea, long columna) {
        System.out.println(descripcion + ":" + lexema +
                          " Línea: " + linea + 
                          " Columna: " + columna);
    }

    public Symbol getToken(int tipo, Object valor) {
        return new Symbol(tipo, yyline, yycolumn, valor);
    }

%}

// Expresiones regulares
letra = [a-zA-Z]
digito = [0-9]
id = {letra}({letra}|{digito})*
entero = {digito}+
decimal = {digito}+ "." {digito}+
cadena = \"([^\"\\n]|\\.)*\"
espacio = [ \t\r\n]+

%%

// Ignorar espacios en blanco
{espacio}    { /* no hacer nada */ }

// Palabras clave
"DEFINE"        { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); 
                return getToken(sym.DEFINE, yytext());}
"PRINT"       { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); 
                return getToken(sym.PRINT, yytext());}
"IF"          { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); 
                return getToken(sym.IF, yytext());}
"ELSE"        { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); 
                return getToken(sym.ELSE, yytext());}
"ELSEIF"      { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); 
                return getToken(sym.ELSEIF, yytext());}
"WHILE"       { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); 
                return getToken(sym.WHILE, yytext());}
"LOOP"        { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); 
                return getToken(sym.LOOP, yytext());}
"FUNCTION"    { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); 
                return getToken(sym.FUNCTION, yytext());}
"RETURN"      { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); 
                return getToken(sym.RETURN, yytext());}
"END"         { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); 
                return getToken(sym.END, yytext());}
"DO"          { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); 
                return getToken(sym.DO, yytext()); }
"THEN"        { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); 
                return getToken(sym.THEN, yytext()); }



// Tipos de datos y booleanos
"true"        { imprimirToken("Booleano", yytext(), yyline, yycolumn); 
                return getToken(sym.TRUE, yytext());}
"false"       { imprimirToken("Booleano", yytext(), yyline, yycolumn); 
                return getToken(sym.FALSE, yytext());}

// Operadores aritméticos
"+"           { imprimirToken("Operador aritmético", yytext(), yyline, yycolumn); 
                return getToken(sym.SUMA, yytext());}
"-"           { imprimirToken("Operador aritmético", yytext(), yyline, yycolumn);
                return getToken(sym.RESTA, yytext());}
"*"           { imprimirToken("Operador aritmético", yytext(), yyline, yycolumn); 
                return getToken(sym.MULTIPLICACION, yytext());}
"/"           { imprimirToken("Operador aritmético", yytext(), yyline, yycolumn); 
                return getToken(sym.DIVISION, yytext());}

// Operadores relacionales
"<="          { imprimirToken("Operador relacional", yytext(), yyline, yycolumn); 
                return getToken(sym.MENORIGUAL, yytext());}
">="          { imprimirToken("Operador relacional", yytext(), yyline, yycolumn); 
                return getToken(sym.MAYORIGUAL, yytext());}
"<"           { imprimirToken("Operador relacional", yytext(), yyline, yycolumn); 
                return getToken(sym.MENOR, yytext());}
">"           { imprimirToken("Operador relacional", yytext(), yyline, yycolumn); 
                return getToken(sym.MAYOR, yytext());}
"=="          { imprimirToken("Operador relacional", yytext(), yyline, yycolumn); 
                return getToken(sym.IGUAL, yytext());}
"!="          { imprimirToken("Operador relacional", yytext(), yyline, yycolumn); 
                return getToken(sym.DIFERENTE, yytext());}

// Operadores lógicos
"AND"         { imprimirToken("Operador lógico", yytext(), yyline, yycolumn); 
                return getToken(sym.AND, yytext());}
"OR"          { imprimirToken("Operador lógico", yytext(), yyline, yycolumn); 
                return getToken(sym.OR, yytext());}
"NOT"         { imprimirToken("Operador lógico", yytext(), yyline, yycolumn); 
                return getToken(sym.NOT, yytext());}

// Identificadores
{id}          { imprimirToken("Identificador", yytext(), yyline, yycolumn); 
                return getToken(sym.ID, yytext());}

// Literales numéricos
{decimal}     { imprimirToken("Decimal", yytext(), yyline, yycolumn); 
                return getToken(sym.DECIMAL, Double.parseDouble(yytext()));}
{entero}      { imprimirToken("Entero", yytext(), yyline, yycolumn); 
                return getToken(sym.ENTERO, Integer.parseInt(yytext()));}

// Cadenas
{cadena}      { imprimirToken("Cadena", yytext(), yyline, yycolumn); 
                return getToken(sym.CADENA, yytext());}

// Otros símbolos
"("           { imprimirToken("Símbolo", yytext(), yyline, yycolumn); 
                return getToken(sym.PAREN_IZQUIERDO, yytext());}
")"           { imprimirToken("Símbolo", yytext(), yyline, yycolumn); 
                return getToken(sym.PAREN_DERECHO, yytext());}
"{"           { imprimirToken("Símbolo", yytext(), yyline, yycolumn); 
                return getToken(sym.LLAVE_IZQUIERDO, yytext());}
"}"           { imprimirToken("Símbolo", yytext(), yyline, yycolumn); 
                return getToken(sym.LLAVE_DERECHO, yytext());}
","           { imprimirToken("Símbolo", yytext(), yyline, yycolumn); 
                return getToken(sym.COMA, yytext());}
";"           { imprimirToken("Símbolo", yytext(), yyline, yycolumn); 
                return getToken(sym.PUNTOCOMA, yytext());}


// Error léxico
.             { System.err.println("ERROR: Símbolo no reconocido '" + yytext() + "' en línea " + yyline + ", columna " + yycolumn); }
 