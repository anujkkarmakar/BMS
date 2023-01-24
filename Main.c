#include "LoansTaken.h"

void SelectOptionEmployee(char ch)
{
    clearscr();
    switch(ch)
    {
        case 1: viewCustomersList();
        break; 
        case 2: viewLedger();
        break;
        case 3: viewAccountsBlocked();
        break;
        case 4: closeAccountRequest();
        break;
        case 5: unblockAccount();
        break;
        case 6: //checkLoansTaken();
        break;
        case 7: //sanctionLoan();
        break;
        case 8: return;
        default:
            printf("\nInvalid choice.");
    }
}

void SelectOptionCustomer(char ch)
{
    clearscr();
    switch(ch)
    {
        case 1: addNewAccount();
        break;
        case 2: updateAccountDetails(); 
        break;
        case 3: sendOrReceiveMoney();
        break;
        case 4: checkAccountDetails();
        break;
        case 5: //loanMenu();
        break;
        case 6: closeAccount();
        break;
        case 7: return;
        default:
            printf("\nInvalid choice.");
    }
}

int main()
{
    char choice_outer, choice_inner, c;
    char *pass = (char *)calloc(10,sizeof(char));
    int limit = 0, flag, j;
    do
    {
        clearscr();
        limit = 0;
        LoginMenu();
        scanf("%d", &choice_outer);
        clearscr();
        if(choice_outer == 1)    
        {
            PASSWORD:
            clearscr();
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
            flag = strcmp("admin", pass);
            LoadingPage(flag);
            if(limit < 3 && flag) goto PASSWORD;
            free(pass);
            if(limit == 3)
            {
                printf("\nAdmin Authorisation Request denied!");
                printf("\n\nPress any key to continue...");
                getch();
            }
            else
            {
                do
                {
                    PrintMenuEmployee();
                    scanf("%d", &choice_inner);
                    SelectOptionEmployee(choice_inner);
                    clearscr();
                } while (choice_inner != 8); 
            }
        }
        else if(choice_outer == 2)
        do
        {
            PrintMenuCustomer();
            scanf("%d", &choice_inner);
            SelectOptionCustomer(choice_inner);
            clearscr();
        } while (choice_inner != 7);
        else if(choice_outer != 3)
        {
            printf("Please enter a valid choice.");            
        }        
    } while (choice_outer != 3); 

    printf("Thank you for using the app. Have a nice day :)");

    return 0;
}