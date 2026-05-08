#include<stdio.h>
#include<stdlib.h>
#include<assert.h>
struct bin_node{
  int data;
  struct bin_node *left;
  struct bin_node *right;
};
struct bin_tree{
  struct bin_node *root;
  int count;
};
struct bin_tree *bin_create(void){
  struct bin_tree *tree=malloc(sizeof *tree);
  if(tree==NULL)return NULL;
  tree->root=NULL;
  tree->count=0;
  return tree;
}
int bin_search(const struct bin_tree *tree, int item){
  const struct bin_node *node;
  assert(tree!=NULL);
  node=tree->root;
  for(;;){
    if(node==NULL)return 0;
    else if(item==node->data)return 1;
    else if(item>node->data)node=node->right;
    else node=node->left;
  }
}
int bin_insert(struct bin_tree *tree,int item){
  struct bin_node *node, **new;
  assert(tree!=NULL);
  new = &tree->root;
  node=tree->root;
  for(;;){
    if(node==NULL){
      node=*new=malloc(sizeof *node);
      if(node!=NULL){
        node->data=item;
        node->left=node->right=NULL;
        tree->count++;
        return 1;
      }else return 0;
    }else if(item==node->data)return 2;
    else if(item>node->data){
      new=&node->right;
      node=node->right;
    }else{
      new=&node->left;
      node=node->left;
    }
  }
}
int main(){
  bin_create();  
}
