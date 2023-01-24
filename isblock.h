#include "investments.h"

int accountIsBlocked(bool funtionality)
{
    if(funtionality == true)
    {
        return 0;
    }
    else
    {
    clearscr();
    printf("Sorry! Your account is blocked due to some forseen event. Contact the bank employee. Toll Number: 1800 000 1234");
    getch();
    return 1; //implied that account is blocked for some reason
    }
}