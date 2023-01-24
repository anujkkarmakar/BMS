#include "loadingpage.h"

void checkLoansTaken()
{
    FILE *ptr;
    int n;
    n = 1;
    ptr = fopen("List", "rb");
    if(ptr == NULL)
    {
        printf("\nThe database cannot be found.");
        getch();
        exit(EXIT_FAILURE);
    }
    clearscr();
    printf("Printing the customers who have taken loan from us:\n");
    //reading the data from the file and dispalying it to the console
    while(fread(&ACC, sizeof ACC, 1, ptr))
    {
        if(ACC.previous_loan == true)
        {
            fprintf(stdout, "\n%d\t%s\t%f\t%d year(s)", n++, ACC.acc_number, ACC.name, ACC.emi_amount, ACC.time_period);
        }
    }

    //closing the file pointer
    fclose(ptr);
    printf("\nThere are %d peoples who have taken loan", n-1);
    printf("\n\nPress any key to continue...");
    getch();
}