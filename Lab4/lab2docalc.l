/*	Kay Sweebe
	CS370
	January 25, 2019
	Lab2.2

	The changes made to this lab include:
		- Adding parenthesis (, ) to the regular expression that contains +, -, = and other chars.
                  Without this, whenever a parenthesis was found, lex did nothing with it. Once we added
		  the parenthesis, Lex was then able to pass the parenthesis as tokens to Yacc.  

*/




/*                 Small LEX routine which returns two formal tokens (INTEGER and VARIABLE)
                   along with single string elements like '+'.
 
                    This LEX definition is the companion to the docalc.y YACC routine which
                   is a simple calculator

                    Shaun Cooper
                    January 2015
*/
%{

int mydebug=1;
#include "y.tab.h"
%}


%%

[a-z]		{if (mydebug) fprintf(stderr,"Letter found\n"); 
                       yylval=*yytext-'a'; return(VARIABLE);}
[0-9][0-9]*	{if (mydebug) fprintf(stderr,"Digit found\n"); 
                       yylval=atoi((const char *)yytext); return(INTEGER);}
[ \t]		{if (mydebug) fprintf(stderr,"Whitespace found\n");}
[=\-+*/%&|()] 	{ if (mydebug) fprintf(stderr,"return a token %c\n",*yytext); 
                       return (*yytext);}
\n 		{ if (mydebug) fprintf(stderr,"cariage return %c\n",*yytext); 
                       return (*yytext);}
[i][n][t]   {if (mydebug) fprintf(stderr, "int found\n");}


%%

int yywrap(void)
{ return 1;}

