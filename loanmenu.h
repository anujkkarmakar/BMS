#include "sanctionLoan.h"

void loanMenu()
{
    FILE *ptr, *ptr1;
    long acc_number;
    int flag = 0, cibil_score, limit = 0, j = 0;
    char c, * pass, otp[7];
    float interest;
    clearscr();
    pass = (char *)malloc(21*sizeof(char));
    ptr = fopen("List", "rb");
    ptr1 = fopen("LoanRequest", "ab");
    printf("Thank you for choosing us to serve you in hard times. We are here to assure you the best loan with least interest in the country.");
    
    printf("\nCuurently, we offer only personal loan upto Rs. 5,00,000.00/- \n\'No collateral\' required");
    
    printf("\n\nDear %s, we need few details about you to prcocess the loan ", ACC.name);
    
    START:
    printf("\nPlease enter your account number: ");
    scanf("%ld", &acc_number);

    while(fread(&ACC, sizeof ACC, 1, ptr))
    {
        if(ACC.acc_number == acc_number)
        {
            flag = 1; //indicates that account is found
            if(ACC.previous_loan == true)
            {
                printf("\nSorry %s! We can not offer you the loadn as you have alreay taken a loan from us.", ACC.name);
                printf("\nWe only offer one loan to a person at a time");
            }
            else if(ACC.acc_functional == false)
            {
                printf("\nSorry %s. Your request cannot be processed becase your account is blocked. Please wait paintaintly. We will get back to youonce your account is unblocked.", ACC.name);
            }
            else //indicates that user has not taken an previous loan
            {
                printf("\nGreat %s. It's time for us to look at your cibil score.");
                CIBIL:
                printf("\nPlease enter your cibil score: ");
                scanf("%d", &cibil_score);

                //after taking the cibil score of the user to our system, we check if it is valid and s/he is eligible to get it
                
                if(isCibilValid(cibil_score) == false)
                {
                    printf("\nPlease enter a valid cibil score...");
                    goto CIBIL;
                }
                switch (getCreditLimitagainstCibil(cibil_score))
                {
                case 1:
                    break;
                case 2: interest = 18;
                    break;
                case 3: interest = 15;
                    break;
                case 4: interest = 12;
                    break;  
                //there is no requirement of putting a default statement
                }

                if(getCreditLimitagainstCibil(cibil_score) != 1)
                {
                    c = getchar();
                    switch(c)
                    {
                        case 'Y':
                        case 'y':
                        //when the user wishes to accept the market rate, we require the amt to be taken as loan
                        LOAN:
                        LD.acc_number = ACC.acc_number;
                        LD.loan_amount = getLoanAmount();
                        LD.time_period = getTime();
                        LD.emi_amount = calculatemonthlyLoan(ACC.loan_amount, interest, time);        
                        printf("\nThank you for applying loan with us. We hope you didn't have any hassle to get the loan.");
                        fwrite(&LD, sizeof LD, 1, ptr1);
                        //user has successfully created an application for getting a loan

                        break;
                        case 'n':
                        case 'N':
                        break;
                        default:
                            printf("\nPlease enter a valid choice");
                    }
                }

            }
        }
    }

    if(!flag)
    {
        printf("Sorry your account could not be found");
    }
    //closing the file pointers
    fclose(ptr);
    fclose(ptr1);

    printf("\n\nPress any key to continue...");
    getch();
}

//program flow: the user enters his/her cibil score and the processing is done afterwards
//if the cibil score is good, loan is offered; otherwise not offered

//if offered, the user enters his/her required amount. The prog. tells them the monthly amount they need to pay to the bank. They can also change the amount upon their wish.