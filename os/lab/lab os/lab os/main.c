#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <sys/stat.h>
//the function to read lines of variable length

char* scan_line(char* line)
{
    int ch;             // as getchar() returns `int`
    long capacity = 0;  // capacity of the buffer
    long length = 0;    // maintains the length of the string
    char* temp = NULL;  // use additional pointer to perform allocations in order to avoid memory leaks

    while (((ch = getchar()) != '\n') && (ch != EOF))
    {
        if ((length + 1) >= capacity)
        {
            // resetting capacity
            if (capacity == 0)
                capacity = 2; // some initial fixed length 
            else
                capacity *= 2; // double the size

            // try reallocating the memory
            if ((temp = realloc(line, capacity * sizeof(char))) == NULL) //allocating memory
            {
                printf("ERROR: unsuccessful allocation");
                // return line; or you can exit
                exit(1);
            }

            line = temp;
        }

        line[length] = (char)ch; //type casting `int` to `char`
        length++;
    }
    line[length + 1] = '\0'; //inserting null character at the end

    // remove additionally allocated memory
    if ((temp = realloc(line, (length + 1) * sizeof(char))) == NULL)
    {
        printf("ERROR: unsuccessful allocation");
        // return line; or you can exit
        exit(1);
    }

    line = temp;
    return line;
}
// student and node structs
struct student {
    char name[50];
    float gpa;
    int id;
};
struct node {
    struct student studentData;
    struct node* next;
};

// linked list head
struct node* HEAD = NULL;

// function to insert at end of linked list
void insertEnd(char name[], float gpa, int id) {
    struct node* newNode = (struct node*)malloc(sizeof(struct node));

    //newNode->studentData.name = name;
    memcpy(newNode->studentData.name, name, sizeof(name));
    newNode->studentData.gpa = gpa;
    newNode->studentData.id = id;
    newNode->next = NULL;
    if (HEAD == NULL) {
        HEAD = newNode;
        return;
    }
    struct node* curr = HEAD;
    while (curr->next != NULL) {
        curr = curr->next;
    }
    curr->next = newNode;
}
// function to print linked list data
int printList() {
    struct node* ptr = HEAD;

    while (ptr != NULL) {
        char* name = ptr->studentData.name;
        float gpa = ptr->studentData.gpa;
        int id = ptr->studentData.id;
        printf("%s %f %d\n", name, gpa, id);
        ptr = ptr->next;
    }
    printf("\n");
    return 0;
}

// write data to file
int write_data(char filePath[]) {
    FILE* fptr = fopen(filePath, "w");
    struct node* curr = (struct node*)malloc(sizeof(struct node));
    curr = HEAD;
    // variables to output to file
    char name[50];
    float gpa;
    int id;
    while (curr != NULL) {
        printf("entered\n");
        if (curr->next == NULL) {
            memcpy(name, curr->studentData.name, sizeof(curr->studentData.name));
            gpa = curr->studentData.gpa;
            id = curr->studentData.id;
            
            for (int i = 0; i < 50; i++) {
                if ((name[i] >= 65 && name[i] <= 90) || (name[i] >= 97 && name[i] <= 122)) {
                    fprintf(fptr, "%c", name[i]);
                }
                else {
                    break;
                }

            }
      
            fprintf(fptr, " %f %d", gpa, id);

        }
        else {
            memcpy(name, curr->studentData.name, sizeof(curr->studentData.name));
            gpa = curr->studentData.gpa;
            id = curr->studentData.id;
            for (int i = 0; i < 50; i++) {

                if ((name[i] >= 65 && name[i] <= 90) || (name[i] >= 97 && name[i] <= 122)) {
                    fprintf(fptr, "%c", name[i]);
                }
                else {
                    break;
                }

            }
            
            fprintf(fptr, " %f %d\n", gpa, id);
        }
        curr = curr->next;
    }
    
    fclose(fptr);
}
// read data from user
int get_data() {
    int n = 2;
    char* name = NULL;
    float gpa;
    int id;
    while (n > 0) {
        puts("Please input student name: ");
        name = scan_line(name);
        puts("Please input student gpa: ");
        scanf("%f", &gpa);
        puts("Please input student id: ");
        scanf("%d", &id);
        insertEnd(name, gpa, id);
        n--;
        fflush(stdin);
    }
    




    return 0;
}
// program loop
int loop() {
    get_data();
    printf("done with get_data\n");
    int traverse = printList();
    if (traverse != 0) puts("LinkedList exited incorrectly\n");
    else puts("LinkedList read correctly\n");
    write_data("test.txt");
    printf("done with write_data\n");
    return 0;

}

int main() {
    loop();
    return 0;
}