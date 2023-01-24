#include "viewCustomerList.h"

void viewLedger()
{
    FILE *ptr;
    int n = 1, flag = 1, choice;
    int day, month, year;
    ptr = fopen("Ledger", "rb");

    if(ptr == NULL)
    {
        printf("\nThe database is either deleted or cannot be found.\n\nPlease contact the bank employee. Toll Number: 1800 000 1234\n");
        exit (EXIT_FAILURE); //to indicate failure
    }

    //taking choice as input from the user
    do
    {
        printf("\n1. View all trabsactions");
        printf("\n2. View transactions of a particular day");
        printf("\n3. View transactions by month");
        printf("\n4. View transactions by year");
        printf("\n\nEnter your choice: ");
        scanf("%d", &choice);
        switch (choice)
        {
            case 1: flag = 0;
            break;
            case 2: flag = 0;
        printf("\nEnter the day: ");
                scanf("%d", &day);
            break;
        case 3: flag = 0;
        printf("\nEnter the month: ");
                scanf("%d", &month);
            break;
        case 4: flag = 0;
        printf("\nEnter the year: ");
                scanf("%d", &year);
            break;
        default: printf("\nEnter a valid choice.");
            flag = 1;
            break;
        }
    } while (flag);
    
    
    
    //printing the ledger to the console
    printHeader();
    
    while(fread(&LL, sizeof(LL), 1, ptr))
    {
        if((choice == 2 && LL.DATE.day == day) || (choice == 3 && LL.DATE.month == month) || (choice == 4 && LL.DATE.year == year) || choice == 1)
        fprintf(stdout, "\n%d\t%02d:%02d:%02d\t%02d-%02d-%02d\t\t%ld\t\t%ld\t%s\t\t%.2f\t\t%.2f", n++, LL.DATE.hour, LL.DATE.min, LL.DATE.sec, LL.DATE.day, LL.DATE.month, LL.DATE.year, LL.user_acc_number, LL.ben_acc_number, (LL.type=='W')?"Withdraw":(LL.type=='D')?"Deposit":"Transfer", LL.old_balance, LL.new_balance);
    }

    //closing the file pointer
    fclose(ptr);
    printf("\n\nThere are total %d transcations made.", n-1);
    printf("\n\nPress any key to continue...");
    getch();
}