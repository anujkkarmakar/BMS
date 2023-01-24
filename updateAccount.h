#include "unblockAccount.h"


void updateAccountDetails()
{
    FILE *ptr, *ptr1;
    
    long acc_number;
    int flag = 0; //flag = 0 indicates that there is no match found
                  //flag = 1 indicates that the details of the account have been updated
    int choice;

    ptr = fopen("List", "rb");
    ptr1 = fopen("Listtemp", "wb");

    if(ptr == NULL || ptr1 == NULL)
    {
        printf("\nThe database is either deleted or cannot be found.\n\nPlease contact the bank employee. Toll Number: 1800 000 1234\n");
        exit (EXIT_FAILURE); //to indicate failure
    }

    //now taking the account number as input from the user
    //then we match it with the database
    //if found, the user can change his/her account details

    printf("\nEnter your account number: ");
    scanf("%ld", &acc_number);

    while(fread(&ACC, sizeof(ACC), 1, ptr))
    {
        if(ACC.acc_number == acc_number)
        {
            //when there is a match we print the old details on the console
            //and ask the user which details to update

            printf("\n");
            printf("\nName: %s", ACC.name);
            printf("\nMobile Number: %ld", ACC.mobile_number);
            printf("\nI.D. Number: %ld", ACC.id_number);
            printf("\nAge: %d", ACC.age);
            printf("\nType of account: %s", (ACC.acc_type == 'S')?"Savings":"Current");
            printf("\nAccount balance: Rs. %.2f", ACC.acc_balance);

            printf("\nPlease select one of the following:");
            printf("\n1. Update your name");
            printf("\n2. Update mobile number");
            printf("\n3. Update your ID number");
            printf("\n4. Update your age");
            printf("\n5. Change your account type");
            
            do
            {
                printf("\n\nEnter your choice: ");
                scanf("%d", &choice);
                fflush(stdin);

                switch(choice)
                {
                    case 1: //to update name
                    printf("\nPlease enter your correct name: ");                    
                    scanf("%[^\n]s", ACC.name);
                    printf("\nYour name is updated.");
                    break;

                    case 2: //to update the mobile number
                    printf("\nPlease enter your new mobile number: ");
                    scanf("%ld", &ACC.mobile_number);
                    printf("\nYour new mobile number has been saved.");
                    break;

                    case 3: //to update govt. approved ID number
                    printf("\nPlease enter your ID number: ");
                    scanf("%ld", &ACC.id_number);
                    printf("\nDetails for your ID number has been updated.");
                    break;

                    case 4: //to update age of the user
                    printf("\nPlease enter your correct age: ");
                    scanf("%d", &ACC.age);
                    printf("\nYour age is successfully stored.");
                    break;

                    case 5: //to change the account type
                    printf("\nAccount type has been changed.");
                    if(ACC.acc_type == 'S')
                        ACC.acc_type = 'C';
                    else
                        ACC.acc_type = 'S';
                    break;

                    default: //when no condition matches
                    printf("\nInvalid choice. Please do enter a valid choice.");
                }
            } while (!(1 <= choice && choice <= 5));
            
            //updating the value of flag
            flag = 1;
        }
        //writing the output to the tempfile named "Listtemp"

        fwrite(&ACC, sizeof(ACC), 1, ptr1);
    }

    if(!flag) //when flag = 0 then we display a message to the user that the account is not found
              //and we terminate this process
    {
        printf("\nSorry! No account found with account number %ld.\nPlease try again next time.");
        fclose(ptr);
        fclose(ptr1);
        return;
    }

    //if flag = 1 then we read data from tempfile and write it to main file
    fclose(ptr);
    fclose(ptr1);

    ptr = fopen("List", "wb");
    ptr1 = fopen("Listtemp", "rb");

    while(fread(&ACC, sizeof(ACC), 1, ptr1))
    {
        fwrite(&ACC, sizeof(ACC), 1, ptr);
    }

    fclose(ptr);
    fclose(ptr1);
    remove("Listtemp"); //the temporary file is deleted
}