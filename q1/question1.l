%{
#include<stdio.h>
#include <sys/stat.h>
int words = 0;
struct stat st;
%}

%%
([a-zA-Z0-9])*    {words++;}

%%

int main()
{
    yyin=fopen("input.txt", "r");
    yylex();
    {printf("%5d words",words); words = 0;};

    stat("input.txt", &st);
    char size = st.st_size;
    
    printf("%5d bytes\n", size);
    return 0;

}

int yywrap()
{
    return 1;
}