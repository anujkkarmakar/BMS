#include "loanapplication.h"

void sanctionLoan()
{
    FILE *ptr, *ptr1, *ptr2;
    long acc_number;
    long flag;
    flag = 0;
    ptr = fopen("List", "rb");
    ptr1 = fopen("LoanRequest", "rb");
    ptr2 = fopen("Listtemp", "wb");

    if(ptr == NULL || ptr1 == NULL || ptr2 == NULL)
    {
        exit 0;
    }
    clearscr();
    printf("Enter the account number whose loan would get sanctioned: ");
    scanf("%ld", &acc_number);

    while(fread(&ACC, sizeof ACC, 1, ptr))
    {
        if(ACC.acc_number == acc_number)
        while(fread(&LD, sizeof LD, 1, ptr1))
        {
            if(LD.acc_number == acc_number)
            {
                //when the account number matches, we update the details of the user
                flag = 1;
                ACC.emi_amount = LD.emi_amount;
                ACC.loan_amount = LD.loan_amount;
                ACC.time_period = LD.time_period;
                ACC.previous_loan = true;
            }
        }
        fwrite(&ACC, sizeof ACC, 1, ptr2);
    }

    if(!flag)
    {
        printf("Sorry no account with the entered account number could be found that has applied for loan");
    }

    //closing the file pointers
    fclose(ptr);
    fclose(ptr1);
    fclose(ptr2);

    remove("List");
    rename("Listtemp", "List");
    printf("\n\nPress any key to continue...");
    getch();
}