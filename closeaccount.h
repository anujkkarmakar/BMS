#include "addNewAccount.h"


void closeAccount()
{
    FILE *ptr, *ptr1, *ptr2;
    
    long acc_number;
    int flag = 0; //flag = 0 indicates that there is no match found
                  //flag = 1 indicates that the details of the account have been updated
    char choice, c;
    int decide = -99, limit = 0, j = 0;
    char *pass = (char *)malloc(21*sizeof(char));

    ptr = fopen("List", "rb");
    ptr1 = fopen("Listtemp", "wb");
    ptr2 = fopen("AccountDeletion", "ab");

    if(ptr == NULL || ptr1 == NULL || ptr2 == NULL)
    {
        printf("\nThe database is either deleted or cannot be found.\n\nPlease contact the bank employee. Toll Number: 1800 000 1234\n");
        getch();
        return;
    }

    //now taking the account number as input from the user
    //then we match it with the database
    //if found, the user gets the final prompt of whether to keep the account or delete it

    printf("\nEnter your account number: ");
    scanf("%ld", &acc_number);

    while(fread(&ACC, sizeof(ACC), 1, ptr))
    {
        if(ACC.acc_number == acc_number)
        {
            //when the match is found, we require the user to enter his/her password which helps us to
            //verify that user has requested deletion

            PASSWORD:
            printf("\nEnter the password. Press \'spacebar\' to input\nEnter: ");
            j = 0;
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
            LoadingPage(flag);
            if(flag && limit < 3) //i.e., if(flag != 0)
                goto PASSWORD;

            free(pass); //memory is returned to the OS so as to prevent memeory leakage
            //if the no. of attemts have been finished then we halt the process

            if(limit == 3)
            {
                clearscr();
                printf("\nYou have reached the limit of entering the password. Process terminated!");
                printf("\n\nPress any key to terminate your session...");
                getch();
            }
            else
            {
                clearscr();
                printf("\nWe are sorry %s to see you not liking our service", ACC.name);
                printf("\nBut you can still consider not closing your account as we are working to serve our customers better");
                printf("\nRemember that this process cannot be reversed.\n");
                printf("\n\nDo you still want to proceed (Y or N)? ");
                
                do
                {
                    fflush(stdin);
                    choice = getchar();
                    
                    switch (choice)
                    {
                    case 'y':
                    case 'Y': //request for account closure
                        decide = 0;
                        break;
                    case 'n':
                    case 'N': //user doesn't want to close his/her account
                        decide = 1;
                    default:
                        decide = -1;
                        printf("\nInvalid choice. Please do enter a valid choice: ");
                        break;
                    }
                }while(decide == -1);
                
                flag = 1;
                
                if(!decide)
                {
                    CD.acc_number = ACC.acc_number;
                    fwrite(&CD, sizeof(CD), 1, ptr2);
                    printf("\nYour account deletion request is accepted. Your account will be delted with the next 48 hrs.");
                    printf("\nYou will receive a confirmation SMS after your account has been closed.");
                    printf("\nThank you for being our valuable customer :)");
                    printf("\n");
                    //we are sending the request to the bank employee for veficiation and proper closure of the account
                    printf("\nPress any key to terminate the session...");
                    fclose(ptr);
                    fclose(ptr2);
                    fclose(ptr1);
                    getch();
                    return;
                }
            }
        }
    }

    if(!flag) //when flag = 0 then we display a message to the user that the account is not found
              //and we terminate this process
    {
        printf("\nSorry! No account found with account number %ld.\nPlease try again next time.");
    }

    if(decide) //if (decide != 0)
    {
        //when the user decides not to close the account
        clearscr();
        printf("Thank you for staying with us!");
    }
    fflush(ptr);
    fflush(ptr1);
    fflush(ptr2);
    fclose(ptr);
    fclose(ptr1);
    fclose(ptr2);

    printf("\nPress any key to continue...");
    
    getch();
    return;
}