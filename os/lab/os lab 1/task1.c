#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
#include <stdbool.h>
#include <math.h>
#include <ctype.h>
// node struct that stores student data and pointer to next node
struct node{
    char * name;
    float gpa;
    unsigned int id;
    struct node* next;
};

// pointer to head
struct node *HEAD = NULL;

// function to print items in linked list
void print_data(){
    struct node *ptr = HEAD;
    
    while(ptr != NULL){
        printf("%s %f %u\n", ptr->name, ptr->gpa, ptr->id);
        ptr = ptr->next;
    }
}
// function to clear newlines from console
void clearNewLine() {
    int c;
    do
    {
        c = getchar();
    } while (c != '\n' && c != EOF);
}
//function to insert node at end of list (finished and works fine)
void insertEnd(const char* nName, float nGpa, unsigned int nId){
    // allocate memory for new node
    struct node *newNode = (struct node*) malloc(sizeof(struct node));
    // allocate memory for name 
    newNode->name = (char*) malloc(sizeof(nName));
    memcpy(newNode->name, nName, sizeof(nName));
    newNode->gpa = nGpa;
    newNode->id = nId;
    newNode-> next = NULL;
    // if linked list is empty then newNode is the head
    if(HEAD == NULL) HEAD = newNode;
    else{
        // loop till end of linked list
        struct node *lastNode = HEAD;
        while(lastNode->next != NULL){
            lastNode = lastNode->next;
        }
        lastNode->next = newNode;
    }
    
}

// function to validate that data entered by user is correct (not needed anymore)
// bool validate_data(const char*name, float gpa, unsigned int id){
//     unsigned int size = strlen(name);
//     // loop to size -1 as last byte is '\0'
//     for(int i = 0; i < size-1; i++){
//         // check that each character is either lower case or upper case and has no other characters
//         // NOTE:I am only storing first names only, so any combination of names with spaces will output false
//         if((name[i] >= 65 && name[i] <=90) || (name[i] >= 97 && name[i] <= 122)) continue;
//         else return false;
//     }
//     // check if gpa is between 0.0 and 4.0
//     if(gpa < 0.0 ||  gpa > 4.0) return false;
//     // check if id is not greater than 5 digits
//     if(floor(log10(id)) + 1 > 5) return false;
//     return true;
// }


// function to read data from user (finished and works fine with edge cases)
void read_data_from_user(){
    bool flag = true;
    char* name = 0;
    size_t nameSize = 0;
    char* gpaStr = 0;
    size_t gpaSize = 0;
    unsigned int num;
    printf("Please enter the details of the student: \n");
    //int i = 1;
    while(flag){
        printf("Please enter name of student: ");
        //printf("size of %s is:  %zu\n", name, nameSize);
        // check name entered
        bool flagStr = false;
        while(!flagStr){
            size_t nameStrSize = getline(&name, &nameSize, stdin);
            unsigned int size = strlen(name);
            bool flagWrongChar = false;
            // loop to size -1 as last byte is '\0'
            for(int i = 0; i < size-1; i++){
                // check that each character is either lower case or upper case and has no other characters
                // NOTE:I am only storing first names only, so any combination of names with spaces will output false
                if((name[i] >= 65 && name[i] <=90) || (name[i] >= 97 && name[i] <= 122)) continue;
                else{
                    flagWrongChar = true;
                    break;
                }
            }
            if(!flagWrongChar)flagStr = true;
            else{
                printf("Please enter a valid name ( must only contain lower and upper case letters only): ");

            }
        }

        char *p = strchr(name, '\n');  // finds first, if any, \n
        if (p != NULL) *p = '\0';
        
        // get gpa
        printf("Please enter the student's gpa: ");
        //size_t gpaStrSize = getline(&gpaStr, &gpaSize, stdin);
        char c;
        float gpa;
        bool gpaFlag = false;
        size_t gpaStrSize;
        while(!gpaFlag){
            
            gpaStrSize = getline(&gpaStr, &gpaSize, stdin);
            int dotNum = 0;
            bool valid = true;
            size_t len = strlen(gpaStr);
            for(int i = 0; i <  len; i++){
                if(gpaStr[i] == '.') dotNum++;
                if(dotNum > 1) {
                    valid = false;
                    break;
                }
                if((gpaStr[i] < 48 || gpaStr[i] > 57) && dotNum <2 && gpaStr[i] != '\n' && gpaStr[i] != '\0' && gpaStr[i] != '.') {valid = false; break;}
            }
            
            if(valid){
                gpaFlag = true;
            }else{
                printf("Please enter a valid float: ");
            }
            // not working properly
            // if(sscanf(gpaStr, "%f %c", &gpa, &c)){
            //     if(gpa < 0.0 ||  gpa > 4.0){
            //     printf("Please enter a gpa value between 0.0 and 4.0: ");
            //     continue;
            //     }else{
            //         gpaFlag = true;
            //     }
            // }else{
            //     printf("Please enter a valid float: ");
            // }
            
        }
        
        // do special checking for user input to make sure they are correct
        printf("Please enter user id: ");
        
        bool flag2 = false;
        while(!flag2){
            if(scanf("%u%c", &num, &c) != 2 || c != '\n')
            printf("Please enter valid ID number: ");
            else{
                if( num >= 0 && floor(log10(num)) + 1 <= 5){
                    flag2 = true;
                }else{
                    printf("ID must be greater than >= 0 and no more than 5 digits: ");
                    continue;
                }
                
            }
        }
        // add to linked list
        insertEnd(name, atof(gpaStr), num);
        
        // ask user if he wants to add another student's details
        char input;
        char ch;
        printf("Would you like to add more students' details? Y/N: ");
        while (scanf("%c", &input) != 1 || (input != 'N' && input != 'Y'))
        {
            while ((ch = getchar()) != '\n')
                ;
            printf("Enter correct letter: ");
        }
        if(input == 'N') flag = false;
        else {
            clearNewLine();
            continue;
        }

    }
    free(name);
    free(gpaStr);
}



// function to write to file, takes char* as input which contains the path of the file (finished & Tested)
void write_data(char* filePath){
    FILE *fptr = fopen(filePath, "w");
    
    if(fptr == NULL){
        printf("File failed to open\n");
        return;
    }
    struct node* curr = (struct node*) malloc(sizeof(struct node));
    curr = HEAD;
    while(curr != NULL){
        if(curr->next == NULL){
            fprintf(fptr, "%s %f %u", curr->name, curr-> gpa, curr->id);
        }else{
            fprintf(fptr, "%s %f %u\n", curr->name, curr-> gpa, curr->id);
        }
        curr = curr -> next;
    }
    free(curr);
    fclose(fptr);
}

// function to extract name from file
char *getWord(FILE *fp){
    char word[100];
    int ch, i=0;

    while(EOF!=(ch=fgetc(fp)) && !isalpha(ch))
        ;//skip
    if(ch == EOF)
        return NULL;
    do{
        word[i++] = tolower(ch);
    }while(EOF!=(ch=fgetc(fp)) && isalpha(ch));

    word[i]='\0';
    return strdup(word);
}

// function to read data
void read_data(char* filePath){
    
    
    FILE *fp = fopen(filePath, "r");
    //check if file opened
    if(fp == NULL){
        printf("File failed to open\n");
        return;
    }
    
    char* word;
    int count = 0;
    char* name;
    float gpa;
    unsigned int id;
    
    while((word = getWord(fp))){
        name = word;
        fscanf(fp, "%f", &gpa);
        fscanf(fp, "%u", &id);
        // insert to end of list
        insertEnd(name, gpa, id);
    }
    // free char pointers
    free(word);
    free(name);
    fclose(fp);
}


// function to calculate standard deviation
float stdCalc(float mean, int n){
    float sd = 0.0;
    struct node* curr = (struct node*) malloc(sizeof(struct node));
    curr = HEAD;
    while(curr != NULL){
        sd += pow(curr->gpa - mean, 2);
        curr = curr-> next;
    }
    free(curr);
    return sqrt(sd/n);
}
// function to print stats about students, prints min, max, avg and standard deviation 
void print_stats(){
    float avg;
    float min= 4.1, max = -0.1;
    float stddev;
    float sum = 0.0;
    int n = 0;
    struct node * curr = (struct node*) malloc(sizeof(struct node));
    curr = HEAD;
    while(curr != NULL){
        sum += curr->gpa;
        if(curr->gpa > max) max = curr-> gpa;
        if(curr->gpa < min) min = curr-> gpa;
        n++;
        curr = curr-> next;
    }
    // get mean by sum/n
    avg = sum/n;
    stddev = stdCalc(avg, n);
    free(curr);
    printf("The mean of the GPA is: %f\n", avg);
    printf("The standard deviation of the GPA is: %f\n", stddev);
    printf("Max GPA is: %f\n", max);
    printf("Min GPA is: %f\n", min);
    return;
}




// done
void mainLoop(){
    char c;
    char ch;
    bool flag = true;
    char FILENAME[] = "tests.txt";
    // read data regardless of user choice
    read_data(FILENAME);
    // loop until user exits
    while(flag){
        printf("Please choose one of the following options:\n");
        printf("a. Read students' data.\n");
        printf("b. Enter student data.\n");
        printf("c. Calculate students' statistics.\n");
        printf("d. Exit program. \n");
        printf("Enter option: ");
        // read options and make sure user inputs a, b, c or d
        while(scanf("%c", &c) != 1 || (c != 'a' && c!='b' && c!='c' && c!= 'd')){
            while((ch = getchar()) != '\n');
            
            printf("Please enter one of the options above: ");
        }
        // switch on option
        switch(c){
            case 'a':
                    print_data();
                    break;
            case 'b':
                    ch = getchar();
                    read_data_from_user();
                    write_data(FILENAME);
                    break;
            case 'c':
                    print_stats();
                    break;
            case 'd':
                    return;

        }
        // rempve \n character
        ch = getchar();
        
        // if flag then ask user if he wants to continue or exit
        if(flag){
            printf("Would you like to choose another option? Y/N: ");
            //clearNewLine();
            while (scanf("%c", &c) != 1 || (c != 'N' && c != 'Y'))
            {
                while((ch = getchar()) != '\n');
                ch = getchar();
                printf("Enter correct letter: ");
            }
            if(c == 'N') flag = false;
        }
        // remove new line at end
        ch = getchar();
    }
    

}



int main(){
    // //read_data_from_user();
    // read_data("tests.txt");
    // //write_data("tests.txt");
    // print_stats();
    // printList();
    mainLoop();
    return 0;
}