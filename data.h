#include "color.h"

struct ledger_details
{
    struct transaction_details
    {
        /*A structure for storing the attributes of a broken-down time.*/
        int day; // Stores the day of month: 1-31
        int month; // Stores the month *since* Jan: 0-11
        int year; // Stores the year *since* 1900
        int sec; // Stores sec from 0 to 60
        int min; // Minutes: 0-59
        int hour; // Stores hour since midnight: 0-23
    }DATE;
    long user_acc_number;
    long ben_acc_number;
    char type;
    float old_balance;
    float new_balance;
}LL;

struct account_details
{
    char name[20];
    long acc_number;
    char dob[10];
    long id_number;
    int age;
    char password[21];
    long mobile_number;
    float acc_balance;
    char acc_type;
    int time_period;
    bool acc_functional;
    bool previous_loan;
    float loan_amount;    
    float emi_amount;
}ACC;

struct closure_deatails
{
    long acc_number;
}CD;

struct pending_transactions
{
    long acc_number;
    float amount;
}PT;

struct loan_details
{
    long acc_number;
    float loan_amount;    
    float emi_amount;
    int time_period;
}LD;