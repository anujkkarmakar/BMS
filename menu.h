#include "loanapplication.h"

void MainHeader()
{
    printf("\n==================================================================================================================================");
    SetColor(14);
    printf("\n\tWelcome to DIGITAL BANK Pvt. Ltd.\t");
    SetColor(10);
    printf("| A unit of DIGITAL World Holdings Pvt. Ltd. \
    | Building nation since 1980");
    SetColor(15);
    printf("\n==================================================================================================================================\n\n");
}

void LoginMenu()
{
    MainHeader();   
    printf("1. Employee Login\n");
    printf("2. Bank Customer Login\n");
    printf("3. Exit the process\n");
    printf("\nEnter your choice: ");
}

void PrintMenuEmployee() 
{
    MainHeader();
    printf("1. View Customer's List\n");
    printf("2. View Transactions\n");
    printf("3. View accounts blocked\n");
    printf("4. Account closure request\n");
    printf("5. Unblock Accounts\n");
    printf("6. Views Loans Taken\n");
    printf("7. Exit\n");
    printf("\nEnter your choice: ");
}

void PrintMenuCustomer()
{
    MainHeader();
    printf("1. Open an account with us\n");
    printf("2. Update the details of an account\n");
    printf("3. Transfer Money\n");
    printf("4. Check account details\n");
    printf("5. Get a persoanl loan\n");
    printf("6. Close your account\n");
    printf("7. Exit\n");
    printf("\nEnter your choice: ");
}