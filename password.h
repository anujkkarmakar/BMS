/*
TO BE UPDATED
*/

#include "data.h"

// void passwordCheck(char password[21])
// {
//     FILE *ptr, *ptr1, *ptr2;
//     ptr = fopen("List", "rb");
//     ptr1 = fopen("passListtemp", "wb");
//     int limit, flag, j;
//     char c, *pass, otp[7];

//     pass = (char *)calloc(21, sizeof(char));

//     limit = 0;

//     if(ptr == NULL || ptr1 == NULL)
//     {
//         clearscr();
//         printf("\nThe database might have been deleted or cannotbe found inthe current directory. Please contact the bank employee. Toll Number 1800 000 1234");
//         sleep(5000); //5 seconds the computer sleep before it resumes its activities
//         exit (EXIT_FAILURE);
//     }

//     PASSWORD:
//     clearscr();
//                 printf("\nEnter the password. Press \'spacebar\' to input\nEnter: ");
//                 limit++;
//                 while((c = getch())!= ' ')
//                 {
//                     pass[j] = c;
//                     j++;
//                     fprintf(stdout, "%s", "*");
//                 }
//                 printf("\n");
//                 pass[j] = '\0';
//                 flag = strcmp(password, pass);
//                 if(flag && limit < 3) //i.e., if(flag != 0)
//                 goto PASSWORD;

//                 if(limit == 3) //when the user has finished all the attempsts of entering the password
//                 {
//                     clearscr();
//                     printf("\nYou have reached the limit of entering the password. If you forget, you can change your password.");
//                     printf("\n\nDo you wih to change your password (Y or N): ");
//                     fflush(stdin);
//                     c = getchar();
//                     limit = 0;

//                     switch(c)
//                     {
//                         case 'Y':  //when the user wants to update the password
//                         //here since the application is not deployed, we require the test OTP to be "000000"
//                         clearscr();
//                         OTP:
//                         limit++;
//                         printf("\nEnter the 6-digit OTP received in your mobile number: ");
//                         //system_generated_otp = generateAndSendOTP(ACC.mobile_number);
//                         scanf("%6s", otp);
//                         flag = strcmp(otp, "000000"); //for testing
//                         //real version = flag = strcmp(otp, system_generated_otp);
                        
//                         if(!flag && limit < 3)
//                         {
//                             puts("Yeppie. Matched");
//                             printf("\nSetting up a password for your account can prevent unauthorise access.\n");
//                             printf("\nPassword must not contain any space, special characters. Allowed characters are: a-z, and 0-9. Maximum length allowed is 20\n\n"); 
//                             printf("Enter password: ");
//                             fflush(stdin);
//                             scanf("%[a-z,0-9]s", ACC.password);

//                             while(strlen(ACC.password) > 20)
//                             {
//                                 printf("\n\nPlease re-enter password: "); 
//                                 fflush(stdin);
//                                 scanf("%[A-Z,a-z,0-9]s", ACC.password);
//                             }

//                             clearscr();
//                             printf("\nGreat! Your details have been updated!");
//                         }
//                         else if(limit < 3)
//                         {
//                             clearscr();
//                             printf("\nPlease enter the correct otp: ");
//                             goto OTP;
//                         }
//                         else
//                         {
//                             clearscr();
//                             printf("\nIt seeems like you have utilised all the attempts. Account blocked. Please contact bank employee to unblock your account");
//                             ACC.acc_functional = false; //to indicate that the account is blocked
                            
//                         }
                
//                     }
//                 }
// }