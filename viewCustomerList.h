#include "updateAccount.h"

void viewCustomersList()
{
    FILE *ptr;
    fflush(stdin);
    int n = 1;
    ptr = fopen("List", "rb");

    if(ptr == NULL)
    {
        printf("\nThe database is either deleted or cannot be found.\n\nPlease contact the bank employee. Toll Number: 1800 000 1234\n");
        return; //to indicate failure
    }

    //printing the customer's list

    while(fread(&ACC, sizeof(ACC), 1, ptr))
    {
        printf("\n");
        printf("\nCustomer Number:     %d", n++);
        printf("\nName:                %s", ACC.name);
        printf("\nMobile Number:       %ld", ACC.mobile_number);
        printf("\nAccount Number:      %ld", ACC.acc_number);
        printf("\nI.D. Number:         %ld", ACC.id_number);
        printf("\nAge:                 %d", ACC.age);
        printf("\nType of account:     %s", (ACC.acc_type == 'S')?"Savings":"Current");
        printf("\nAccount balance: Rs. %.2f", ACC.acc_balance);
        printf("\nAccount blocked:     %s", (ACC.acc_functional == false)?"Yes":"No");
    }

    //closing the file pointer
    fclose(ptr);
    printf("\n\nPress any key to continue...");
    getch();
}