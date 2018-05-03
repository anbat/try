/* 7.Design, develop and implement a c/c++/java program to simulate the working of shortest remaining time and round robin(RR) scheduling algorithms. Experiment with different quantums sizes for RR algorithm */

#include<stdio.h> 
#include<stdlib.h>

int no;

void roundrobin(int,int,int[],int[]);
void srtf();
main()
{
	int n,tq,choice;
	int bt[10], st[10], i,j,k;
	for(;;)
	{
		printf("Enter choice\n");
		printf("1.Round Robin \n2.str \n3.Exit\n");
		scanf("%d",&choice);
		switch(choice)
		{
			case 1: printf("Round robin scheduling algorithm\n");
				printf("Enter the number of process\n");
				scanf("%d",&n);
				printf("Enter burst time for sequences\n");
				for(i=0;i<n;i++)
				{
					scanf("%d",&bt[i]);
					st[i]=bt[i];
				}
				printf("Enter time quantum\n");
				scanf("%d",&tq);
				roundrobin(n,tq,st,bt);
				break;
			case 2: printf("\n\n-------------------Shortest remaining time------");
				srtf();
				break;
			case 3: exit(0);
				break;
		}
	}
}
	
void roundrobin(int n, int tq, int st[], int bt[])
{
	int time=0;
	int tat[10],wt[10],i,count=0,swt=0,stat=0,temp1,sq=0,j,k;
	float awt=0.0, atat=0.0; 
	while(1)
	{
		for(i=0,count=0;i<n;i++)
		{
			temp1=tq;
			if(st[i]==0)
			{
				count++;
				continue;
			}
			if (st[i]>tq)
				st[i]=st[i]-tq;
			else if(st[i]>=0)
			{
				temp1=st[i];
				st[i]=0;
			}
			sq=sq+temp1;
			tat[i]=sq;
		}
		if(n==count)
		break;
	}
	for(i=0;i<n;i++)
	{
		wt[i]=tat[i]-bt[i];
		swt=swt+wt[i];
		stat=stat+tat[i];
	}
	awt=(float)swt/n;
	atat=(float)stat/n;
	printf("process no   burst time 	waiting time 	turnaround time\n");
	for(i=0;i<n;i++)
		printf("%d \t\t %d \t\t %d \t\t %d \t\t\n",i+1,bt[i],wt[i],tat[i]);
	printf("average waiting time is%f\n avg turnaround time is %f\n",awt,atat);
	
}

void srtf()
{
	int n,j=0,st[10],bt[10],rt[10],remain=0,smallest,time=0,i,endtime,swt=0,stat=0;
	printf("enter the no. of process:");
	scanf("%d",&n);
	for(i=0;i<n;i++)
	{
		printf("enter the arrivaltime for p[%d]:",i+1);
		scanf("%d",&st[i]);
		printf("enter the burst time for p[%d]:",i+1);
		scanf("%d",&bt[i]);
		rt[i]=bt[i];
	}
	rt[100]=999;
	printf("process\t|writing time\t|turnarround time\n");
	for(time=0;remain!=n;time++)
 	{
 		smallest=100;
 		for(i=0;i<n;i++)
		{
			if(st[i]<=time && rt[i]<rt[smallest] && rt[i]>0)
			{
				smallest=i;
			}
		}
		rt[smallest]--;
		if(rt[smallest]==0)
		{
			remain++;
			endtime=time+1;
			j=smallest;
			printf("p[%d]\t|\t%d\t|\t%d\n",smallest+1,endtime-bt[j]-st[j],endtime-st[j]);
			swt +=endtime-bt[j]-st[j];
			stat +=endtime-st[j];
		}
	}
	float awt=0.0,atat=0.0;
	awt=(float)swt/n;
	atat=(float)stat/n;
	printf("average waiting time:%f\n",awt);
	printf("average turnarround time:%f\n",atat);
}



/*
output:-

Enter choice
1.Round Robin 
2.str 
3.Exit
1
Round robin scheduling algorithm
Enter the number of process
4
Enter burst time for sequences
4 2 5 2
Enter time quantum
15
process no   burst time 	waiting time 	turnaround time
1 		 4 		 0 		 4 		
2 		 2 		 4 		 6 		
3 		 5 		 6 		 11 		
4 		 2 		 11 		 13 		
average waiting time is5.250000
 avg turnaround time is 8.500000
Enter choice
1.Round Robin 
2.str 
3.Exit
2


-------------------Shortest remaining time------enter the no. of process:5
enter the arrivaltime for p[1]:3
enter the burst time for p[1]:5
enter the arrivaltime for p[2]:0
enter the burst time for p[2]:4
enter the arrivaltime for p[3]:5
enter the burst time for p[3]:4
enter the arrivaltime for p[4]:7
enter the burst time for p[4]:2
enter the arrivaltime for p[5]:5
enter the burst time for p[5]:4
process	|writing time	|turnarround time
p[2]	|	0	|	4
p[1]	|	1	|	6
p[4]	|	2	|	4
p[3]	|	6	|	10
p[5]	|	10	|	14
average waiting time:3.800000
average turnarround time:7.600000
Enter choice
1.Round Robin 
2.str 
3.Exit
*/
