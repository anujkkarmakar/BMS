#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <stdbool.h>
#include <limits.h>
#include <string.h>
#include <math.h>
#include <windows.h>
#include <time.h>

void clearscr(void);
void LoadingPage(int match);
float fixedDepositInterest(float, float, int);
float recurringDepositInterest(float, float, int);
void fixedDepositMenu();
void recurringDepositMenu();
void SelectOptionCustomer(char);
void SelectOptionEmployee(char);
void performPendingTransaction(long);
void sendOrReceiveMoney();
void addNewAccount();
void viewAccountsBlocked();
void closeAccountRequest();
void printHeader();
void viewTransactions();
void checkAccountDetails();
int accountIsBlocked(bool);
void LoadingPage(int);
int loanApproval(bool);
bool isCibilValid(int);
int getCreditLimitagainstCibil(int);
float calculatemonthlyLoan(float, float, int);
float getLoanAmount();
void sanctionLoan();
int getTime();
void updateLoanDetails();
void loanMenu();
void checkLoansTaken();
void LoginMenu();
void PrintMenuEmployee();
void PrintMenuCustomer();
void passwordCheck(char password[21]);
void unblockAccount();
void updateAccountDetails();
void viewCustomersList();
void viewLedger();
void MainHeader();
void SetColor(int ForgC);