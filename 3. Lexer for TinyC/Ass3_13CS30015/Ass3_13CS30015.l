/* C Declarations and Definitions */
%{
	#include "y.tab.h"
%}

NZ_DIG				[1-9]
DIG 				[0-9]
ID_DIG 				[_a-zA-Z]
SIGN 				[+-]
DIG_SEQ 			{DIG}+
EXP_PART 			([eE]{SIGN}?{DIG_SEQ})
ZERO 				"0"
ESC_SEQ 			[\\a\\b\\f\\n\\r\\t\\v\\\'\\\"\\?\\\\]
C_CHAR 				[^\'\\\n]|{ESC_SEQ}
C_CHAR_SEQ 			{C_CHAR}+
C_CHAR_CONST 		('\{C_CHAR_SEQ}\')

S_CHAR [^\"\\\n]|{ESC_SEQ}
S_CHAR_SEQ {S_CHAR}+
FRACTIONAL_CONST	([0-9]+\.)|([0-9]*\.[0-9]+)

ID					[_a-zA-Z][_a-zA-Z0-9]*
INT_CONST			([1-9][0-9]*)|"0"
FLOAT_CONST			(((([0-9]+)?\.[0-9]+)|([0-9]+\.))([eE][+-]?[0-9]+)?)|([0-9]+[eE][+-]?[0-9]+)
ENUM_CONST			[_a-zA-Z][_a-zA-Z0-9]* 
CHAR_CONST			\'(([^\'\\\n]|[\\a\\b\\f\\n\\r\\t\\v\\\'\\\"\\?\\\\])+)\'
STRING_LITERAL		\"(([^\"\\\n]|[\\a\\b\\f\\n\\r\\t\\v\\\'\\\"\\?\\\\])*)\"
MULTI_COMMENT		"/"\*(([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*)\*+"/"
SINGLE_COMMENT		"//".*
WHITE_SPACE			[ \t\n\v]


/* Definitions of Rules & Actions */

%%

{SINGLE_COMMENT}	{return SINGLE_COMMENT;}
{MULTI_COMMENT}		{return MULTI_COMMENT;}

"auto"				{return AUTO_KEYWORD;}
"enum"				{return ENUM_KEYWORD;}
"restrict"			{return RESTRICT_KEYWORD;}
"unsigned"			{return UNSIGNED_KEYWORD;}
"break"				{return BREAK_KEYWORD;}
"extern"			{return EXTERN_KEYWORD;}
"return"			{return RETURN_KEYWORD;}
"void"				{return VOID_KEYWORD;}
"case"				{return CASE_KEYWORD;}
"float"				{return FLOAT_KEYWORD;}
"short"				{return SHORT_KEYWORD;}
"volatile"			{return VOLATILE_KEYWORD;}
"char"				{return CHAR_KEYWORD;}
"for"				{return FOR_KEYWORD;}
"signed"			{return SIGNED_KEYWORD;}
"while"				{return WHILE_KEYWORD;}
"const"				{return CONST_KEYWORD;}
"goto"				{return GOTO_KEYWORD;}
"sizeof"			{return SIZEOF_KEYWORD;}
"_Bool"				{return BOOL_KEYWORD;}
"continue"			{return CONTINUE_KEYWORD;}
"if"				{return IF_KEYWORD;}
"static"			{return STATIC_KEYWORD;}
"_Complex"			{return COMPLEX_KEYWORD;}
"default"			{return DEFAULT_KEYWORD;}
"inline"			{return INLINE_KEYWORD;}
"struct"			{return STRUCT_KEYWORD;}
"_Imaginary"		{return IMAGINARY_KEYWORD;}
"do"				{return DO_KEYWORD;}
"int"				{return INT_KEYWORD;}
"switch"			{return SWITCH_KEYWORD;}
"double"			{return DOUBLE_KEYWORD;}
"long"				{return LONG_KEYWORD;}
"typedef"			{return TYPEDEF_KEYWORD;}
"else"				{return ELSE_KEYWORD;}
"register"			{return REGISTER_KEYWORD;}
"union"				{return UNION_KEYWORD;}

{ID}				{return IDENTIFIER;}
{INT_CONST}			{return INTEGER_CONSTANT;}
{FLOAT_CONST}		{return FLOAT_CONSTANT;}
{ENUM_CONST}		{return ENUMERATION;}
{CHAR_CONST}		{return CHAR_CONSTANT;}
{STRING_LITERAL}	{return STRING_LITERAL;}

"["                 { return PUNCTUATOR; }
"]"                 { return PUNCTUATOR; }
"("                 { return PUNCTUATOR; }
")"                 { return PUNCTUATOR; }
"{"                 { return PUNCTUATOR; }
"}"                 { return PUNCTUATOR; }
"."                 { return PUNCTUATOR; }
"->"                { return PUNCTUATOR; }
"++"                { return PUNCTUATOR; }
"--"                { return PUNCTUATOR; }
"&"                 { return PUNCTUATOR; }
"*"                 { return PUNCTUATOR; }
"+"                 { return PUNCTUATOR; }
"-"                 { return PUNCTUATOR; }
"~"                 { return PUNCTUATOR; }
"!"                 { return PUNCTUATOR; }
"/"                 { return PUNCTUATOR; }
"%"                 { return PUNCTUATOR; }
"<<"                { return PUNCTUATOR; }
">>"                { return PUNCTUATOR; }
"<"                 { return PUNCTUATOR; }
">"                 { return PUNCTUATOR; }
"<="                { return PUNCTUATOR; }
">="                { return PUNCTUATOR; }
"=="                { return PUNCTUATOR; }
"!="                { return PUNCTUATOR; }
"^"                 { return PUNCTUATOR; }
"|"                 { return PUNCTUATOR; }
"&&"                { return PUNCTUATOR; }
"||"                { return PUNCTUATOR; }
"?"                 { return PUNCTUATOR; }
":"                 { return PUNCTUATOR; }
";"                 { return PUNCTUATOR; }
"..."               { return PUNCTUATOR; }
"="                 { return PUNCTUATOR; }
"*="                { return PUNCTUATOR; }
"/="                { return PUNCTUATOR; }
"%="                { return PUNCTUATOR; }
"+="                { return PUNCTUATOR; }
"-="                { return PUNCTUATOR; }
"<<="               { return PUNCTUATOR; }
">>="               { return PUNCTUATOR; }
"&="                { return PUNCTUATOR; }
"^="                { return PUNCTUATOR; }
"|="                { return PUNCTUATOR; }
","                 { return PUNCTUATOR; }
"#"                 { return PUNCTUATOR; }


{WHITE_SPACE}	;	

%%