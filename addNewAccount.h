#include "accountdeatils.h"

void addNewAccount()
{
    FILE *ptr, *ptr1;
    int rate, choice;
    int flag = 0;
    time_t rawtime;
    struct tm *info;
    time( &rawtime );
    info = localtime( &rawtime );

    ptr = fopen("List", "ab");
    ptr1 = fopen("Ledger", "ab");
    if(ptr == NULL || ptr1 == NULL)
    {
        printf("\nThe database is either deleted or cannot be found.\n\nPlease contact the bank employee. Toll Number: 1800 000 1234\n");
        return; //to indicate failure
    }

    //printing a welcome message to warmly welcome our new customer
    //first impression is always the last impression

    printf("\n\n");
    SetColor(4);
    printf("\tWelcome Onboard! We are happy that you choose to bank with us\n");

    //user needs to enter his/her basic details which can be used for further communication
    //if s/he leaves onboarding process in between, so the user can resume whenever s/he feels comfortable
    
    fflush(stdin);
    SetColor(14);
    printf("\nEnter your name: ");
    SetColor(10);
    scanf("%[^\n]s", ACC.name);

    SetColor(14);
    printf("\nEnter your govt. approved ID Number: ");
    SetColor(10);
    scanf("%ld", &ACC.id_number);

    SetColor(14);
    printf("\nMobile Number: ");
    SetColor(10);
    scanf("%ld", &ACC.mobile_number);

    fflush(stdin);
    SetColor(14);
    printf("\nEnter your date of birth in DDMMYYYY format: ");
    SetColor(10);
    scanf("%s", ACC.dob);

    SetColor(15);
    START:
    printf("\nEnter your age: ");
    scanf("%d", &ACC.age);
    if(ACC.age < 1 || ACC.age > 100) //when the user enters age that is either negative or more than 100
        goto START;

    printf("\nGreat, %s! Your personal details have been saved.\nWe only need few more information before we setup your account", ACC.name);
    printf("\n\n\nWhich type of account would you open ?");
    printf("\n1. Savings Account");
    printf("\n2. Current Account");
    printf("\n3. Fixed Deposit");
    printf("\n4. Recurring Deposit");

    do
    {        
        printf("\nEnter the type of account to proceed: ");
        fflush(stdin);
        scanf("%d", &choice);

        switch (choice)
        {
        case 1 :
            ACC.acc_type = 'S'; 
            break;
        case 2 :
            ACC.acc_type = 'C';
            break;
        case 3 :
            ACC.acc_type = 'F';
            break;
        case 4 :
            ACC.acc_type = 'R';
            break;
        default:
            fprintf(stdout, "%s", "Choice Invalid.\n");
            break;
        }
    } while (choice < 1 || choice > 4);
    
    //we also prompt the user to set a password for thier account so that nobody can unethically access it

    printf("\nSetting up a password for your account can prevent unauthorise access.\n");
    printf("\nPassword must not contain any space, special characters. Allowed characters are: a-z, and 0-9. Maximum length allowed is 20\n\n");
    
    do
    {
        SetColor(1); 
        printf("Enter password: ");
        fflush(stdin);
        SetColor(3);
        scanf("%[a-z,0-9]s", &ACC.password);
        if(strlen(ACC.password) > 20)
        {
            SetColor(4);
            printf("\n\nPlease re-enter password correctly\n");
        }
        SetColor(15);
    } while (strlen(ACC.password) > 20);
    
    printf("\nEnter your account number: ");
    scanf("%ld", &ACC.acc_number);

    //we then check if the following account number is present ot nor
    //if not present, the account opening operation proceeds further
    //if close, the account program requires the user to enter a new account number

    //Implementation to be developed

    //next we require the user to fund the account with an initial money.
    //if FD or RD is chosen, we display the rates
    //accordinngly the user shall proceed
    switch (choice)
    {
        case 1:
            OPEN1:
            printf("\nMinimum initial investment required towards account opening is Rs. 1,000.00");
            printf("\nEnter the amount you would wish to add: ");
            scanf("%f", &ACC.acc_balance);
            if(ACC.acc_balance < 1000.0)
            {
                printf("\nPlease fund the account immediately.");
                goto OPEN1;
            }
            ACC.time_period = 0;
            break;
        case 2:
            OPEN2:
            printf("\nMinimum initial investment required towards account opening is Rs. 2,000.00");
            printf("\nEnter the amount you would wish to add: ");
            scanf("%f", &ACC.acc_balance);
            if(ACC.acc_balance < 2000.0)
            {
                printf("\nPlease fund the account immediately.");
                goto OPEN2;
            }
            break;
            ACC.time_period = 0;
        case 3:
            fixedDepositMenu(); //prinitng the menu to the console
            OPEN3:
            printf("\nMinimum initial investment required towards account opening is Rs. 1,000.00");
            printf("\nEnter the amount you would wish to add: ");
            scanf("%f", &ACC.acc_balance);
            printf("\nEnter the option for the time period of investing: ");
            scanf("%d", &ACC.time_period);
            if(ACC.acc_balance < 1000.0  || ACC.time_period < 1 || ACC.time_period > 4)
            {
                printf("\nPlease enter the details correctly.");
                goto OPEN3;
            }
            if(ACC.time_period == 1) ACC.time_period = 0.5;
            else if(ACC.time_period == 2) ACC.time_period = 1;
            else if(ACC.time_period == 3) ACC.time_period = 2;
            else ACC.time_period = 3;
            break;
        case 4:
            recurringDepositMenu();
            OPEN4:
            printf("\nMinimum initial investment required towards account opening is Rs. 500.00");
            printf("\nEnter the amount you would wish to add: ");
            scanf("%f", &ACC.acc_balance);
            printf("\nEnter the option for the time period of investing: ");
            scanf("%d", &ACC.time_period);
            if(ACC.acc_balance < 500.0  || ACC.time_period < 1 || ACC.time_period > 4)
            {
                printf("\nPlease enter the details correctly.");
                goto OPEN4;
            }
            if(ACC.time_period == 1) ACC.time_period = 0.5;
            else if(ACC.time_period == 2) ACC.time_period = 1;
            else if(ACC.time_period == 3) ACC.time_period = 2;
            else ACC.time_period = 3;
            break;
    
    }

    //closing remarks
    //the user rates his/her experience based on the standard scale of 1 to 5
    //collecting ranking also helps us to improve our services provided

    printf("\nHow was your experience with opening a new account(1-5)? ");
    do
    {   
        fflush(stdin) ;
        scanf("%d", &rate);

        switch (rate)
        {
            case 5:
                fprintf(stdout, "Wow! We are happy to know that you liked the process\n");
                break;
            case 4:
                fprintf(stdout, "Great buddy! We would love to hear where we went wrong\n");
                break;
            case 3:
                fprintf(stdout, "It seems that the process was cumbersome. Don't worry we'll strive better as always\n");
                break;
            case 2:
                fprintf(stdout, "We are sorry for the incovience caused. You can share the feedback with the bank employee\n");
                break;
            case 1:
                fprintf(stdout, "We are extremely sorry for provising you this service. You can share the feedback with the bank employee\n");
                break;
            default:
                fprintf(stdout, "\nPlease do enter a valid number between 1 to 5: ");
                break;
        }
    }while(!(0 < rate && rate < 6));

    ACC.acc_functional = true;
    ACC.previous_loan = false;

    //updating the ledger details
    LL.user_acc_number = ACC.acc_number;
    LL.new_balance = ACC.acc_balance;
    LL.ben_acc_number = ACC.acc_number;   
    LL.old_balance = 0;
    LL.type = 'D';
    LL.DATE.hour = info->tm_hour;
    LL.DATE.day = info->tm_mday;
    LL.DATE.min = info->tm_min;
    LL.DATE.sec = info->tm_sec;
    LL.DATE.month = info->tm_mon + 1;
    LL.DATE.year = info->tm_year + 1900;

    fwrite(&LL, sizeof(struct ledger_details), 1, ptr1);
    fwrite(&ACC, sizeof(ACC), 1, ptr); //appending the data of the customer to the binary file
    fflush(ptr);
    fflush(ptr1);
    fclose(ptr);
    fclose(ptr1);
    printf("\n\nPress any key to continue...");
    getch();
}