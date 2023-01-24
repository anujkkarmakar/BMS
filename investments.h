#include "closeaccount.h"

float fixedDepositInterest(float principal, float interest, int term)
{
    return (principal * pow(1 + interest/100, term));
}

void fixedDepositMenu()
{
    //to implement clearscr() method in Main.c so to clear the screen and then dispaly the corresponding menu
    printf("Thank you for choosing to grow money with us by investing in \'Fixed Deposit\'.");
    printf("\n\n");
    printf("It is our pleasure to give you the best interest rate in the country.");
    //printf(" Please choose the type of F.D. you want to open");
    printf("\n\n");
    printf("Types of F.D.s we offer:\n");
    //printf("1. Normal F.D.\n");
    //printf("2. Tax Saving F.D.\n");

    printf("1. 2.5%% p.a. for 6 months\n");
    printf("2. 4.5%% p.a. for 1 year\n");
    printf("3. 5.2%% p.a. for 2 years\n");
    printf("4. 5.5%% p.a. for 3 years\n");
    printf("\nN.B.: As per Govt. rules, senior citizens will recieve a 0.5%% extra interest (over and above the standard rate).");
    printf("\n\nPlease enter a choice: ");
}

void recurringDepositMenu()
{
    //to implement clearscr() method in Main.c so to clear the screen and then dispaly the corresponding menu
    printf("Thank you for choosing to grow money with us by investing in 'Recurring Deposit\'.");
    printf("\n\n");
    printf("It is our pleasure to give you the best interest rate in the country.");
    printf("\n\n");
    printf("Types of R.D.s we offer:\n");
    printf("1. 2.5%% p.a. for 6 months\n");
    printf("2. 4.5%% p.a. for 1 year\n");
    printf("3. 5.2%% p.a. for 2 years\n");
    printf("4. 5.5%% p.a. for 3 years\n");
    printf("\nPlease enter a choice: ");
}

float recurringDepositInterest(float principal, float interest, int n)
{
    float maturity_value;
    for (int i = 1; i <= n; i++)
    {
        maturity_value += principal* pow(1+interest/4, 4*interest/12);
    }
    return maturity_value;
}