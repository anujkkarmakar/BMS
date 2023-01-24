#include "menu.h"

void performPendingTransaction(long ben_acc_number)
{
    FILE *ptr, *ptr1, *ptr2, *ptr3;
    time_t rawtime;
    struct tm *info;
    time( &rawtime );
    info = localtime( &rawtime );
    
    ptr = fopen("List", "rb");
    ptr1 = fopen("PendingTransactions", "rb");
    ptr2 = fopen("Listtemp", "wb");
    ptr3 = fopen("Ledger", "ab");

    if(ptr == NULL || ptr1 == NULL || ptr2 == NULL || ptr3 == NULL)
    {
        printf("Database cannot be found.");
        printf("\n\nPress any key to continue...");
        getch();
        exit (EXIT_FAILURE);
    }

    fread(&PT, sizeof PT, 1, ptr1);

    while(fread(&ACC, sizeof ACC, 1, ptr))
    {
        if(ACC.acc_number == PT.acc_number)       
        {             
            LL.user_acc_number = ben_acc_number;   
            LL.ben_acc_number = ACC.acc_number;   
            LL.old_balance = ACC.acc_balance;
            ACC.acc_balance += PT.amount;
            LL.new_balance = ACC.acc_balance;
            LL.type = 'T';
            LL.DATE.hour = info->tm_hour;
            LL.DATE.day = info->tm_mday;
            LL.DATE.min = info->tm_min;
            LL.DATE.sec = info->tm_sec;
            LL.DATE.month = info->tm_mon + 1;
            LL.DATE.year = info->tm_year + 1900;
            fwrite(&LL, sizeof LL, 1, ptr3);
        }
        fwrite(&ACC, sizeof ACC, 1, ptr2);
    }
    
    fflush(ptr);
    fflush(ptr1);
    fflush(ptr2);
    fflush(ptr3);

    fclose(ptr);
    fclose(ptr1);
    fclose(ptr2);
    fclose(ptr3);
    
    remove("List");
    remove("PendingTransactions");
    rename("Listtemp", "List");
}

void sendOrReceiveMoney()
{
    int choice, flag = 0, j = 0, limit = 0, found = 0;
    time_t rawtime;
    struct tm *info;
    time( &rawtime );
    info = localtime( &rawtime );

    system("setterm -bold on");

    long acc_number, ben_acc_number;
    float money;
    struct account_details BEN;
    FILE *ptr, *ptr1, *ptr2, *ptr3, *ptr4;
    char c, * pass = (char *)calloc(21, sizeof(char));
    char otp[7];

    ptr = fopen("List", "rb"); //opening the binary file in both raeding mode
    ptr2 = fopen("PendingTransactions", "wb");
    ptr1 = fopen("Ledger", "ab");
    ptr3 = fopen("List", "rb");
    ptr4 = fopen("Listtemp", "wb");

    if(ptr == NULL || ptr1 == NULL || ptr2 == NULL || ptr3 == NULL || ptr4 == NULL)
    {
        printf("\nThe database is either deleted or cannot be found.\n\nPlease contact the bank employee. Toll Number: 1800 000 1234\n");
        exit (EXIT_FAILURE); //to indicate failure
    }

    //first the user need to enter his or her account number
    //after that we need to verfiy if that exists or not
    //if it exixts, we require the user to enter the password
    //then the password is matched with the password in the database

    printf("\nEnter your account number :");
    scanf("%ld", &acc_number);

    while(fread(&ACC, sizeof(ACC), 1, ptr))
    {
        if(ACC.acc_number == acc_number)
        {
            if(accountIsBlocked(ACC.acc_functional) == 1) //when the account of user is blocked, s/he cannot do the transaction.
            {
                clearscr();
                printf("Sorry your account is blocked due to suspecious activity. You are not allowed to withdraw or transfer money. You can only deposit money into your account. We will notify you once your account is unblocked.");
                printf("\n");
                do
                {
                    printf("\nDo you want to deposit money? (Y/N) ");
                    c = getchar();
                    switch (c)
                    {
                    case 'y':
                    case 'Y': goto DEPOSIT;
                        flag = 1;
                        break;
                    case 'n':
                    case 'N':
                        flag = 0;
                        break;
                    default:
                        printf("\nPlease enter a valid choice.\n");
                        flag = -1;
                        break;
                    }
                } while (flag = -1);
                
                
            }
            else //when the account is not blocked
            { 
                PASSWORD:
                clearscr();
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
                    clearscr();
                    printf("\nYou have reached the limit of entering the password. If you forget, you can change your password.");
                    printf("\n\nDo you wih to change your password (Y or N): ");
                    fflush(stdin);
                    c = getchar();
                    limit = 0;

                    switch(c)
                    {
                        case 'Y':  //when the user wants to update the password
                        //here since the application is not deployed, we require the test OTP to be "000000"
                        clearscr();
                        OTP:
                        limit++;
                        printf("\nEnter the 6-digit OTP received in your mobile number: ");
                        //system_generated_otp = generateAndSendOTP(ACC.mobile_number);
                        scanf("%6s", otp);
                        flag = strcmp(otp, "000000"); //for testing
                        //real version = flag = strcmp(otp, system_generated_otp);
                        
                        if(!flag && limit < 3)
                        {
                            puts("Yeppie. Matched");
                            printf("\nSetting up a password for your account can prevent unauthorise access.\n");
                            printf("\nPassword must not contain any space, special characters. Allowed characters are: a-z, and 0-9. Maximum length allowed is 20\n\n"); 
                            printf("Enter password: ");
                            fflush(stdin);
                            scanf("%[a-z,0-9]s", ACC.password);

                            while(strlen(ACC.password) > 20)
                            {
                                printf("\n\nPlease re-enter password: "); 
                                fflush(stdin);
                                scanf("%[A-Z,a-z,0-9]s", ACC.password);
                            }

                            clearscr();
                            printf("\nGreat! Your details have been updated!");
                        }
                        else if(limit < 3)
                        {
                            clearscr();
                            printf("\nPlease enter the correct otp: ");
                            goto OTP;
                        }
                        else
                        {
                            clearscr();
                            printf("\nIt seeems like you have utilised all the attempts. Account blocked. Please contact bank employee to unblock your account");
                            ACC.acc_functional = false; //to indicate that the account is blocked
                            
                        }
                        break;

                        case 'N':
                            clearscr();
                            printf("\nAccount blocked for entering wrong password. Please contact bank employee to unblock your account");
                            ACC.acc_functional = false;
                            printf("\n\n");
                            printf("Press any key to continue...");
                            getch(); 
                            
                        default:
                            printf("Please enter a valid chocie.");
                    }
                }
                else //when the password matches 
                {
                    clearscr();
                    printf("\nPress 1. to ");
                    SetColor(10);
                    printf("deposit");
                    SetColor(15);
                    printf(" money into your account");
                    printf("\nPress 2. to ");
                    SetColor(12);
                    printf("withdraw");
                    SetColor(15);
                    printf(" money from your account");
                    printf("\nPress 3. to ");
                    SetColor(14);
                    printf("send");
                    SetColor(15);
                    printf(" money to a beneficiary");
                    printf("\nCurrently the process of sending and receiving money, in Abroad, is under process. We will notify you once it is functional");

                    do
                    {
                        printf("\n\nEnter choice: ");
                        scanf("%d", &choice);
                        switch(choice)
                        {
                            case 2: //since the user transfers moeny to and fro in his/her account 
                            case 1: //we donot perform any checking into it
                            ben_acc_number = acc_number;
                            break;
                            case 3: //when the customer wants to send money to some other account
                            //taking the input of the beneficiary account number from the user
                            clearscr();
                            printf("Enter the account number of the beneficiay: ");
                            scanf("%ld", &ben_acc_number);
                            break;
                            default: printf("\nPlease enter a valid account number");
                        }
                    } while (0 <= choice && choice >= 4);
                    
                    //printing the current balance of the user to the console so that s/he can know how much money
                    //is avaiable to be send

                    printf("\nYour current balance is Rs. %.2f", ACC.acc_balance);    

                    printf("\n\nEnter the amount to be %s: ", (choice == 1)?"deposited":(choice == 2)?"withdrawn":"send");
                    scanf("%f", &money);

                    //savings account can never be overdrawn, i.e., account balance cannot become negative
                    //whereas current account can be overdrawn

                    if(choice == 2) // withdrawal of money
                    {
                        if(money > ACC.acc_balance && ACC.acc_type == 'S')
                        {
                            puts("\nSorry! Your insufficient balance. Process failed.");
                        }
                        else
                        {
                            ACC.acc_balance -= money; 
                            //now adding the successful transaction to the ledger
                            LL.user_acc_number = ACC.acc_number;
                            LL.new_balance = ACC.acc_balance;
                            LL.ben_acc_number = ben_acc_number;   
                            LL.old_balance = ACC.acc_balance + money;
                            LL.type = 'W';
                            LL.DATE.hour = info->tm_hour;
                            LL.DATE.day = info->tm_mday;
                            LL.DATE.min = info->tm_min;
                            LL.DATE.sec = info->tm_sec;
                            LL.DATE.month = info->tm_mon + 1;
                            LL.DATE.year = info->tm_year + 1900;     
                            
                            fwrite(&LL, sizeof(LL), 1, ptr1);                          
                        }
                        
                    }
                    else if(choice == 1) // deposit of money
                    {
                        DEPOSIT:
                        ACC.acc_balance += money;
                        //now adding the successful transaction to the ledger                        
                        LL.user_acc_number = ACC.acc_number;
                        LL.new_balance = ACC.acc_balance;
                        LL.ben_acc_number = ben_acc_number;   
                        LL.old_balance = ACC.acc_balance - money;
                        LL.type = 'D';
                        LL.DATE.hour = info->tm_hour;
                        LL.DATE.day = info->tm_mday;
                        LL.DATE.min = info->tm_min;
                        LL.DATE.sec = info->tm_sec;
                        LL.DATE.month = info->tm_mon + 1;
                        LL.DATE.year = info->tm_year + 1900;
                        
                        fwrite(&LL, sizeof(struct ledger_details), 1, ptr1);
                    }
                    else // transfer of money
                    {
                        TRANSFER:
                        found = 0;
                        while(fread(&BEN, sizeof BEN, 1, ptr3)) //searching the list to find the benificiary
                        {
                            if(BEN.acc_number == ben_acc_number)
                            {
                                if(accountIsBlocked(BEN.acc_functional) == 1)
                                {
                                    clearscr();
                                    printf("\nSorry! Transcation failed. The account of the beneficiary is blocked.");
                                    found = -1;
                                    break;
                                }
                                else
                                {
                                    found = 1;
                                    ACC.acc_balance -= money;
                                    
                                    LL.user_acc_number = ACC.acc_number;
                                    LL.new_balance = ACC.acc_balance;
                                    LL.ben_acc_number = ben_acc_number;   
                                    LL.old_balance = ACC.acc_balance + money;
                                    LL.type = 'T';
                                    LL.DATE.hour = info->tm_hour;
                                    LL.DATE.day = info->tm_mday;
                                    LL.DATE.min = info->tm_min;
                                    LL.DATE.sec = info->tm_sec;
                                    LL.DATE.month = info->tm_mon + 1;
                                    LL.DATE.year = info->tm_year + 1900;
                                    
                                    fwrite(&LL, sizeof LL, 1, ptr1);

                                    PT.amount = money;
                                    PT.acc_number = BEN.acc_number;
                                    fwrite(&PT, sizeof PT, 1, ptr2);
                                }
                            }
                        }
                        if(!found)
                        {
                            clearscr();
                            printf("\nSorry! No accounts found. Would you like to go back (Y or N)? ");
                            c = getch();
                            if(c == 'Y' || c == 'y')
                            {
                                rewind(ptr3);
                                goto TRANSFER;
                            }
                        }
                    }
                    printf("\nYour current balance is Rs. %.2f", ACC.acc_balance);  //printing the current balance of the user after successful transaction
                    if(ACC.acc_type == 'C' && ACC.acc_balance < 0.0f)
                    {
                        printf("\nAccount Overdrawn! Balance is negative. Please pay the amount soon to avoid penalty");
                    }
                }                
            }     
        }

        fwrite(&ACC, sizeof ACC, 1, ptr4);
    }
    fflush(ptr);
    fflush(ptr1);
    fflush(ptr2);
    fflush(ptr3);

    //closing the file pointers
    fclose(ptr);  
    fclose(ptr2);
    fclose(ptr1);
    fclose(ptr3);
    fclose(ptr4);

    remove("List");
    rename("Listtemp", "List");
    if(choice == 3) performPendingTransaction(ben_acc_number);
    else remove("PendingTransactions");

    printf("\n\n");
    printf("Press any key to continue...");
    c = getch();
}