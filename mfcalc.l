%{
    #include<stdlib.h>
   //Automatic Stacker
    #include "calc.h" //Include functions for the symbol table
    #include "mfcalc.tab.h" // To export the bison / yacc declarations
%}



%%

[ \t]  {}
[0-9]+("."[0-9]+)?                              { yylval.NUM = atof( yytext );return NUM; } //action: returns floating number
[sin|cos|tan|atan|asin|acos|log|exp|sqrt|abs]   {
                                                    symrec *s;
                                                    s = getsym(yytext);
                                                    if(s == 0)
                                                        s = putsym (yytext, FNCT);
                                                    *((symrec**) &yylval) = s;
                                                    return s->type;                                                    
                                                }
[a-zA-Z][a-zA-Z0-9]*                            {
                                                    symrec *s;
                                                    s = getsym(yytext);
                                                    if(s == 0)
                                                        s = putsym (yytext, VAR);
                                                    *((symrec**) &yylval) = s;
                                                    return s->type;                                                    
                                                }
[-|+|*|/|\n|=|(|)|^]                            { return *yytext; }    //action: returns operator
.                                               { fprintf (stderr, "ERROR:\tEntered Character is unknown, Try again\n"); }

%%
