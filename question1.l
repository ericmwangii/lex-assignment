%{
#include<stdio.h>
#include <sys/stat.h>
int words = 0;
int digits = 0;
int total = 0;
struct stat st;
%}

%%
([a-zA-Z])*    {words++;}
([0-9])* {digits++;}

%%

int main()
{
    yyin=fopen("input.txt", "r");
    yylex();
    total = words + digits;

    printf("%5d words",words);

    printf("%5d digits",digits);

    printf("%5d total words",total);


    stat("input.txt", &st);
    char size = st.st_size;
    
    
    printf("%5d bytes\n", size);
    return 0;

}

int yywrap()
{
    return 1;
}