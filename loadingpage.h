#include "isblock.h"

void LoadingPage(int match)
{ 
    int i, j;
    char text[] = "Loading";
    printf("\n\n");
    for(i = 0; i < 11; i++)
    {  
        for(j = 0; j < INT_MAX/10; j++); 
        if(i <= 6) printf("%c", text[i]); else printf("."); 
    }
    if(!match) 
    printf("\rDetails Verified Successfully!");
    else
    printf("\rDetails cannot be verified. Please try again.");
    for(j = 0; j < INT_MAX; j++);
    clearscr();
}