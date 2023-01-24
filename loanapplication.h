#include "checkLoans.h"

int loanApproval(bool existing_loan_status)
{
    if(existing_loan_status == true) //when the user has already taken a loan a loan, s/he cannot get another loan. So, we return 0 indicating loan application cannot be processed
        return 0;
    else
        return 1;
}

bool isCibilValid(int cibil_score)
{
    if(cibil_score > 0 && cibil_score < 901)
        return true;
    return false;
}

int getCreditLimitagainstCibil(int cibil_score) 
{
    //we check the credit score of the user and issue credit against thier credit history. A good credit history indicates that the user has done repayments on time. 
    // having a bad credit score will indicate the lickness of defaulting the repayment of loan. If so, the co-lateral will be collected as the price of non-repayment.
    // With a less credit score, loan will be given at a higher rate than the pervailing market rate
    
    if(cibil_score <= 550)
    {
        printf("\nWe are extremely sorry! We could not approve the loan amount");
        return 1;
    }
    else if(cibil_score <= 650)
    {
        printf("\nDear applicant,\nWe are happy to serve you. But your cibil score hints of taking loan at highest rate");
        printf("\n\nDo you wish to take the loan at 18 %% interest rate ");
        printf("\'Y\' or \'N\' ? ");
        return 2;
    }
    else if(cibil_score <= 750)
    {
        printf("\nDear applicant,\nWe are happy to serve you. But your cibil score hints of taking loan at a higher rate");
        printf("\n\nDo you wish to take the loan at 15 %% interest rate ");
        printf("\'Y\' or \'N\' ? ");
        return 3;
    }
    else
    {
        printf("\nDear applicant,\nWe are happy to serve you. Congratulations on maintaing a great CIBIL Score");
        printf("\n\nDo you wish to take the loan at 12 %% interest rate ");
        printf("\'Y\' or \'N\' ? ");
        return 4;
    }
}

float calculatemonthlyLoan(float amount, float interest_rate, int time)
{
    float emi;
    interest_rate = interest_rate / (12 * 100); // one month interest
    time = time * 12; // one month period
    emi = (amount * interest_rate * pow(1 + interest_rate, time)) / (pow(1 + interest_rate, time) - 1);
    return (emi);
}

float getLoanAmount()
{
    float amount;
    LOAN:
    printf("\nEnter the amount you require: ");
    scanf("%f", &amount);
    if(amount < 1 || amount > 500000)
    {
        printf("\nPlease enter a valid amount\n");
        goto LOAN;
    }
    return amount;
}

int getTime()
{
    int time;
    do
    {
        printf("\nEnter the time for the repayment in years. Minimum is 1 year: ");
        scanf("%d", &time);
    } while (time < 1); 
    return time;
}

void updateLoanDetails()
{
    FILE *ptr, *ptr1, *ptr2;
    ptr = fopen("List", "rb");
    ptr1 = fopen("Listtemp", "wb");
    ptr2 = fopen("Loan", "rb");
    
    while (fread(&ACC, sizeof ACC, 1, ptr))
    {
        if(ACC.acc_number == LD.acc_number)
        {
            ACC.previous_loan = true;
            ACC.loan_amount = LD.loan_amount;
            ACC.emi_amount = LD.emi_amount;
        }
        fwrite(&ACC, sizeof ACC, 1, ptr1);
    }

    fflush(ptr);
    fflush(ptr1);
    fflush(ptr2);
    
    fclose(ptr);
    fclose(ptr1);
    fclose(ptr2);
    
    remove("List");
    rename("Listtemp", "List");
}