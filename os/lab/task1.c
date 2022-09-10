#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <sys/stat.h>
struct student{
    
    float gpa;
    int id;
    char  name[256];
};
// node struct that stores student struct and 
struct node{
    struct student data;
    struct node* next;
};


// pointer to head
struct node *HEAD = NULL;

// function to print items in linked list
void printList(){
    struct node *ptr = HEAD;
    printf("\n");
    while(ptr != NULL){
        printf("%s %f %d", ptr->data.name, ptr->data.gpa, ptr->data.id);
        ptr = ptr->next;
    }
}
//function to insert node at end of list
void insertEnd(char* nName, float nGpa, int nId){
    struct node *new = (struct node*) malloc(sizeof(struct node));
    new->data.name = nName;
    new->data.gpa = nGpa;
    new->data.id = nId;
    new->next = NULL;

    if(head == NULL) *head = new;
    else{
        struct node *lastNode = *head;
        while(lastNode->next != NULL){
            lastNode = lastNode->next;
        }
        lastNode->next = new;
    }
    
}






// write data to file
void write_data(char* filePath, char s[], float f, int i){
    
}
// get_data
struct node* get_data(char filePath[]){
    
}
//print _stats
void print_stats(struct node *head){
    
}

//print data
void print_data(struct node *head){

}

// main program loop 
void loop(){
    printList();
}
int main(){
    loop();
    return 0;
}