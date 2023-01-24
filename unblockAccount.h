#include "transactions.h"

void unblockAccount()
{
    FILE *ptr, *ptr1;
    long acc_number, count = 0;

    ptr = fopen("List", "rb");
    ptr1 = fopen("Listtemp", "wb");

    if(ptr == NULL || ptr1 == NULL)
    {
        printf("\nThe database is either deleted or cannot be found.\n\nPlease contact the bank technical support. Toll Number: 1800 000 1234\n");
        return; //to indicate failure
    }

    //we take the account number as input from the employee
    //the employee enters the account number which is to be unblocked

    printf("\nEnter the account number to be unblocked: ");
    scanf("%ld", &acc_number);

    while(fread(&ACC, sizeof ACC, 1, ptr))
    {
        if(ACC.acc_number == acc_number) //when the account matches, we update the details
        if(ACC.acc_functional == false)
        {
            count++;
            ACC.acc_functional = true; //we unblock the account of the user
            //and do not write it to the account number.
            //afterwards, we continue..., i.e., we do not add it to the list
            continue;
        }    
        fwrite(&ACC, sizeof ACC, 1, ptr1);
    }

    if(count == 0)
        printf("\nSorry. No account exists with the given account number. Please enter a valid account number next time.");
    else
        printf("\nThe account holder having account number %ld is unblocked. Communication of the same has been sent to the customer.", acc_number);
    fclose(ptr);
    fclose(ptr1);

    remove("List");
    rename("Listtemp", "List");
    
    printf("\n\nPress any key to continue...");
    getch();
}