DIGIT    [0-9]
HEXD     [A-Fa-f]

ID       [a-zA-Z][_a-zA-Z0-9]*

NUMLIT   [0-9][0-9a-fA-F_.#]*
CHARLIT  '[^'\\\n]'
STRLIT   \"(\\.|[^"\\])*\"
OPRLIT   "."|"<"|">"|"("|")"|"+"|"-"|"*"|"/"|";"|","|"#"|"["|"]"|"="|":="|".."|"<<"|">>"|"<>"|"<="|">="|"!="|"=>"

KEYW     accessor|and|array|begin|boolean|case|character|constant|else|elsiftrue|end|exit|float|functor|iftrue|in|integer|interface|is|loop|mutator|natural|nil|of|or|others|out|positive|proctor|range|record|rtrn|select|subtype|type|unit|when|while

CMT     "/*"([^*]|\*+[^*/])*\*+"/"

%%

{NUMLIT} { fprintf(yyout, "%s (numeric literal)\n", yytext); }

{KEYW}  fprintf(yyout, "%s (keyword)\n", yytext);
     
{ID}   fprintf(yyout, "%s (identifier)\n", yytext);

{CHARLIT} { fprintf(yyout, "%s (character literal)\n", yytext); }

{CMT}   fprintf(yyout, "%s (comment)\n", yytext);

{STRLIT}   fprintf(yyout, "%s (string)\n", yytext);
     
{OPRLIT} fprintf(yyout, "%s (operator)\n", yytext);

[ \t\n]+          /* discard whitespace */
     
.    fprintf(yyout, "UNK: %s\n", yytext);
     
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");

        yyout = fopen("output.txt", "w");
        printf("Done.\n");
    } else {
        yyin = stdin;
    }
     
    yylex();
}

int yywrap() {
    return 1;
}