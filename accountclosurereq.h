#include "accountBlock.h"

void closeAccountRequest() //updation required
{
    FILE *ptr, *ptr1, *ptr2;
    long acc_number;
    int flag = 0; //flag = 0 indicates that there is no match found
                  //flag = 1 indicates that the details of the account have been updated
    char choice, c;

    ptr = fopen("List", "rb");
    ptr1 = fopen("Listtemp", "wb");
    ptr2 = fopen("AccountDeletion", "rb");

    if(ptr == NULL || ptr1 == NULL || ptr2 == NULL)
    {
        printf("\nThe database is either deleted or cannot be found.\n\tOR\nThere might be no account deletion request\n\nPlease contact the bank technical support team. Toll Number: 1800 000 1234\n");
        getch();
        exit(EXIT_FAILURE);
    }

    //now to read the request one by one to chcek if ther

    while(fread(&ACC, sizeof(ACC), 1, ptr))
    {
        while(fread(&CD, sizeof(CD), 1, ptr2))
        {
            if(ACC.acc_number == CD.acc_number) //when the account matches
            {
                //we skip writing whenever we get a match
                flag = 1;
            }
        }
        if(flag == 1)
        {
            flag = 0;
        }
        else
        {
            fwrite(&ACC, sizeof(ACC), 1, ptr1);
        }
        rewind(ptr2);
    }

    fflush(ptr2);
    fflush(ptr);
    fflush(ptr1);

    fclose(ptr2);
    fclose(ptr);
    fclose(ptr1);

    //sending the users a message that their accounts have been successfully deleted\
    //sendClosingVerification();

    //deleting the files 
    remove("AccountDeletion");
    remove("List");
    rename("Listtemp", "List");
}