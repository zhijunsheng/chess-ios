#include<stdio.h>
#include<stdlib.h>
struct node{int data;struct node *link;};
void create(struct node **head,int item){
  struct node *new=malloc(sizeof(struct node)); 
  new->data=item;
  new->link=NULL;
  if(*head==NULL)*head=new;
  else{
    struct node *tmp=*head;
    while(tmp->link!=NULL)tmp=tmp->link;
    tmp->link=new;
  }
}
void traverse(struct node *head){
  if(head==NULL){printf("linked list empty\n");return;}
  struct node *tmp=head;
  while(tmp!=NULL){printf("%d ",tmp->data);tmp=tmp->link;}
} 
int main(){
  struct node *lst=NULL;
  create(&lst,331);
  create(&lst,3331);
  create(&lst,33331);
  traverse(lst);
  printf("\n");
}
