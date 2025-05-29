package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
%column

%{
 
  private Symbol symbol(int type, Object value){
    return new Symbol (type, yyline, yycolumn, value);
  }
  private Symbol symbol(int type){
    return new Symbol (type, yyline, yycolumn);
  }
%}

%%

// Palabras clave
"Robot"           { return new Symbol(sym.PALABRA_RESERVADA, yychar, yyline, yytext()); }

// Acciones
"iniciar"|"detener"|"finalizar" { return new Symbol(sym.ACCION, yychar, yyline, yytext()); }

// CONTROL GARRA
"cerrarGarra()"|"abrirGarra()"|"cerrarGarra"|"abrirGarra" { return new Symbol(sym.CONTROL_GARRA, yychar, yyline, yytext()); }

// Identificadores
[a-zA-Z][0-9]+    { return new Symbol(sym.IDENTIFICADOR, yychar, yyline, yytext()); }

// Métodos
"base"|"cuerpo"|"garra"|"velocidad"|"repetir" { return new Symbol(sym.METODO, yychar, yyline, yytext()); }

// Números
[0-9]+             { return new Symbol(sym.NUMERO_ENTERO, yychar, yyline, yytext()); }

// Operadores
"."                             { return new Symbol(sym.OPERADOR_PUNTO, yychar, yyline, yytext()); }
"="                             { return new Symbol(sym.OPERADOR_ASIGNACION, yychar, yyline, yytext()); }

// Delimitadores

"("                             { return new Symbol(sym.PARENTESIS_A, yychar, yyline, yytext()); }
")"                             { return new Symbol(sym.PARENTESIS_C, yychar, yyline, yytext()); }
","                             { return new Symbol(sym.COMA, yychar, yyline, yytext()); }
";"                             { return new Symbol(sym.PUNTO_COMA, yychar, yyline, yytext()); }

// Comentarios
"//".*                          { return new Symbol(sym.COMENTARIO, yychar, yyline, yytext()); }

// Espacios (ignorar)
[\r\n\t\f ]+                    { return new Symbol(sym.ESPACIO, yychar, yyline, yytext()); }

// Desconocido
.                               { return new Symbol(sym.DESCONOCIDO, yychar, yyline, yytext()); }
