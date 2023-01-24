#include "accountclosurereq.h"

void printHeader()
{
    printf("\nTransaction Details:\n\n");
    printf("====================================================================================================================");
    printf("\n");
    printf("#\tTime\t\tDate\t\t\tFrom\t\tTo\tType\t\tOld Balance\tNew Balance");
    printf("\n");
    printf("====================================================================================================================");
    printf("\n");
}

void viewTransactions(long user_acc_number)
{
    FILE *ptr, *ptr1;
    int count;

    count = 0;
    ptr = fopen("List", "rb");
    ptr1 = fopen("Ledger", "rb");

    while (fread(&LL, sizeof LL, 1, ptr1))
    {
        if(LL.ben_acc_number == user_acc_number || LL.user_acc_number == user_acc_number)
        {
            if(!count)printHeader();
            fprintf(stdout, "\n%d\t%02d:%02d:%02d\t%02d-%02d-%02d\t\t%ld\t\t%ld\t%s\t\t%.2f\t\t%.2f", ++count, LL.DATE.hour, LL.DATE.min, LL.DATE.sec, LL.DATE.day, LL.DATE.month, LL.DATE.year, LL.user_acc_number, LL.ben_acc_number, (LL.type=='W')?"Withdraw":(LL.type=='D')?"Deposit":"Transfer", LL.old_balance, LL.new_balance);
        }
    }
}

void checkAccountDetails()
{
    FILE *ptr;
    int j, limit = 0, flag;
    char c;
    char * pass = (char *)malloc(21*sizeof(char));
    long acc_number;

    ptr = fopen("List", "rb");

    if(ptr == NULL)
    {
        printf("\nThe database is either deleted or cannot be found.\n\nPlease contact the bank employee. Toll Number: 1800 000 1234\n");
        return; //to indicate failure
    }

    //printing the customer's details

    printf("\nEnter your account number: ");
    scanf("%ld", &acc_number);

    while(fread(&ACC, sizeof(ACC), 1, ptr))
    {
        if(ACC.acc_number == acc_number)
        {
             
                PASSWORD:
                j = 0;
                system("cls");
                printf("\nEnter the password. Press \'spacebar\' to input\nEnter: ");
                limit++;
                while((c = getch())!= ' ')
                {
                    pass[j] = c;
                    j++;
                    fprintf(stdout, "%s", "*");
                }
                printf("\n");
                pass[j] = '\0';
                flag = strcmp(ACC.password, pass);
                if(flag && limit < 3) //i.e., if(flag != 0)
                goto PASSWORD;

                free(pass); //memory is returned to the OS so as to prevent memeory leakage
                //if the no. of attemts have been finished then we halt the process

                if(limit == 3) //when the user has finished all the attempsts of entering the password
                {
                    system("cls");
                    printf("\nYou have reached the limit of entering the password. Request to view your account details is denied!");
                }
                else
                {
                    printf("\n");
                    printf("\nName: %s", ACC.name);
                    printf("\nMobile Number: %ld", ACC.mobile_number);
                    printf("\nAccount Number: %ld", ACC.acc_number);
                    printf("\nI.D. Number: %ld", ACC.id_number);
                    printf("\nAge: %d", ACC.age);
                    printf("\nType of account: %s", (ACC.acc_type == 'S')?"Savings":"Current");
                    printf("\nAccount balance: Rs. %.2f", ACC.acc_balance);
                    viewTransactions(ACC.acc_number);
                    break;
                }
        }
                       
        
    }
    //closing the file pointer
    fclose(ptr);

    printf("\n\nPress any key to continue...");
    getch();
}