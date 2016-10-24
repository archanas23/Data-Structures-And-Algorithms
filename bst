#include<stdio.h>
#include<string.h>
#include<stdlib.h>

#define NEW(x) (x*)malloc(sizeof(x))
typedef int bool;
#define true 1;
#define false 0;

//static int counter
typedef struct node
{
	int data;
	struct node *left;
	struct node *right;

}Node;


Node* makenode(int data)
{
	Node* temp;
	temp=NEW(Node);
	if(temp!=NULL)
	{
	 temp->data=data;
	 temp->left=NULL;
	 temp->right=NULL;
	}
return temp;	
}

Node* makeroot(void)
{
	Node* temp=NULL;
	return temp;
}

void display_list(Node *r,int c)
{
	
	static int num_count,temp,maximum,count,max_num,numb;
	if(r!=NULL)
	{
	display_list(r->left,c);
	if(count==0)
	{
		max_num=r->data;
		num_count=1;
		maximum=1;
	}
	if(count>0){
		if(temp==r->data)
		{
			num_count++;
			if(maximum<=num_count)
			{
			max_num=r->data;
			maximum=num_count;
			}
		}
		else
		{
			num_count=1;
		}

	}
	temp=r->data;
	count++;

	printf("the data is %d\n",r->data);
  	
 	display_list(r->right,c);
	}
	if(count==c)
	{
	numb++;
	if(numb==1)
	{
	printf("the max count is %d is of the data %d\n",maximum,max_num);
	return;
	}
	}
}
			
int search(Node* this, int data)
{
	if(this!=NULL)
	
		{	if(this->data==data)
			{
			
			printf("data %d\n",data);
			return data;
			}
			else if(data<this->data)
			{
			search(this->left,data);
			}
			else if(data>this->data)
			{	
			search(this->right,data);
			}
	}
  
	

}

Node* insert(Node* this,int data)
{
  if(this==NULL)
  {	
		return makenode(data);
  }
    
  if(data<=(this)->data)
	{
	this->left=insert(this->left,data);
	}

  else if(data>(this->data))
	{
	this->right=insert(this->right,data);
	}

}


void main(void)
{
	Node* root=NULL;
	int k;
	int number=0,data,count;
	int num;
	printf("Enter the number of elements in the tree:\n");
	scanf("%d",&number);
	int temp=number;
	while(number>0)
	{
	scanf("%d",&data);
	number--;
	root=insert(root,data);
	}
	display_list(root,temp);
	printf("Enter the number to find duplicate:\n");
	scanf("%d",&num);
	k=search(root,num);
	if(k==num)
	{
	printf("yes\n");
	}
	else
	{
	printf("no\n");
	}

}
