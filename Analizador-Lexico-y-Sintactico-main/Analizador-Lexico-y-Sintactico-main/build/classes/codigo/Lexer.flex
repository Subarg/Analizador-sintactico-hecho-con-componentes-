package codigo;
%%
%class Lexer
%type Token



%%

// Palabras clave
"Robot"                         { return Token.PALABRA_RESERVADA; }

// Acciones
"iniciar"|"detener"|"finalizar" { return Token.ACCION; }

// CONTROL GARRA
"cerrarGarra()"|"abrirGarra()"|"cerrarGarra"|"abrirGarra" { return Token.CONTROL_GARRA; }

// Identificadores
[a-zA-Z][0-9]+    { return Token.IDENTIFICADOR; }

// Métodos
"base"|"cuerpo"|"garra"|"velocidad"|"repetir" { return Token.METODO; }

// Números
[0-9]+                          { return Token.NUMERO_ENTERO; }

// Operadores
"."                             { return Token.OPERADOR_PUNTO; }
"="                             { return Token.OPERADOR_ASIGNACION; }

// Delimitadores

"("                             { return Token.PARENTESIS_A; }
")"                             { return Token.PARENTESIS_C; }
","                             { return Token.COMA; }
";"                             { return Token.PUNTO_COMA; }

// Comentarios
"//".*                          { return Token.COMENTARIO; }

// Espacios (ignorar)
[\r\n\t\f ]+                    { return Token.ESPACIO; }

// Desconocido
.                               { return Token.DESCONOCIDO; }

