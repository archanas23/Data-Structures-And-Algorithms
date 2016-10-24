#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct node{
	int  data;
	struct node *next;
	struct node *prev; 

}NODE;

typedef struct root{
	int num;
	NODE *head;
	NODE *tail;

}ROOT;

NODE *makeNode(int data )
{
NODE *n;
n=(NODE*)malloc(sizeof(NODE*));
	if(n!=NULL)
	{
	n->data=data;
	n->next=NULL;
	n->prev=NULL;
	}
  return n;
}


ROOT *makeroot(void)
{
	ROOT *s;
	s=(ROOT*)malloc(sizeof(ROOT*));
	if(s!=NULL)
	{
	s->num=0;
	s->head=NULL;
	s->tail=NULL;
	}
 return s;
}

int push(ROOT *s,int data)
{
	NODE *temp;
	temp=makeNode(data);
	if(temp==NULL)
	{
		return -1;
	}
	if(s==NULL)
	{
		s=makeroot();
		if(s==NULL) 
		{
			return -1;
		}
	}
	(s->num)++;
	if(s->num==1)
	{
		s->tail=temp;
		
	}
	temp->next=s->head;
	s->head=temp;
return 0;	
}

int pop(ROOT *s,NODE *temp)
{
	if(s==NULL)
	{
	return -1;
	}
	if(s->num==1)
	{
	temp=s->head;
	(s->num)--;
	}
	temp=s->head;
	s->head=temp->next;
	(s->num)--;
return 0;	
	
}


void display(ROOT *s)
{
	NODE *temp;
	if(s!=NULL)
	{
	temp=s->head;
	}
	do
	{
	printf("the data in the list is %3d\n",temp->data);
	temp=temp->next;

	}while(temp!=NULL);
	printf("\n");

}


int main(void)
{
	NODE *n;
	ROOT *s;
	s=makeroot();
	if(s==NULL) return -1;
	if(s->head==NULL)
	{
	push(s,5);
	}	
//	push(s,8);
//	push(s,1);
	display(s);
	pop(s,n);
	display(s);
	return 0;
}

