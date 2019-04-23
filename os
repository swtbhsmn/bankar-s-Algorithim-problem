#include <stdio.h>
#include <stdbool.h>
 
    void clrscr()
{
    system("@cls||clear");
}

int userinput() {
	
	//====================SOME-VARIAVBLEs======================
    int curntABC[100][100];
    int maxABC[100][100];
    int avl[5];
    int alloc[5] = {0, 0, 0, 0, 0};
    int max_res[5];
    int process[5];
 
    int i, j, exec, r, p;
    int count = 0;
    bool safe = false;
//==================ENTER-RESOURCE-AND PROCESSES====================

 
 
    
 
    printf("\nEnter the number of processes: ");
    scanf("%d", &p);
    for (i = 0; i < p; i++) {
        process[i] = 1;
        count++;
    }
    
    printf("\nEnter the number of resources: ");
    scanf("%d", &r);
    
 //==================RESOURCE_INSTANCE=====================
 
    printf("\nEnter Resource Instance:");
    for (i = 0; i < r; i++)
    	
        scanf("%d", &max_res[i]);
 
 //====================Allocated Resource===================
 
    printf("\nEnter Allocated Resource Table: ");
    for (i = 0; i < p; i++) {
        for (j = 0; j < r; j++)
            scanf("%d", &curntABC[i][j]);
    }
 //===================MAX-RESOURCE========================
 
 
    printf("\nEnter Maximum Resource table: ");
    for (i = 0; i < p; i++) {
        for (j = 0; j < r; j++)
            scanf("%d", &maxABC[i][j]);
    }
    
    //===========================
    
    // max - Allocation
    int needABC[10][10];	
	for(i=0;i<p;i++){
		for(j=0;j<r;j++){ 
			needABC[i][j]=maxABC[i][j] - curntABC[i][j];
		}
		
	}
	
		
    
 clrscr();


 //========================PRINT-RESOURCE-INSTANCE==========
 printf("===================BANKER'S-ALOGRITHAM================== ");
    printf("\nResource Instance: ");
    for (i = 0; i < r; i++)
        printf("%d ", max_res[i]);
 //========================ALLO-RESOURCE===================
 
    printf("\n Allocated :\n");
    for (i = 0; i < p; i++) {
        for (j = 0; j < r; j++)
            printf("\t%d", curntABC[i][j]);
        printf("\n");
    }
 //============================MAX-RESOURCE=================
 
    printf("\n Maximum:\n");
    for (i = 0; i < p; i++) {
        for (j = 0; j < r; j++){
		
            printf("\t%d", maxABC[i][j]);}
        printf("\n");
    }
 
 printf("\n\n  Remaining:\n  A     B     C\n\n");
		for(i=0;i<p;i++){
			for(j=0;j<r;j++){
		
			printf("  %d   ",needABC[i][j]);
		}
		printf("\n");
		
	}
 
    for (i = 0; i < p; i++)
        for (j = 0; j < r; j++)
            alloc[j] += curntABC[i][j];
 
    printf("\nAllocated resources: ");
    for (i = 0; i < r; i++)
        printf("%d ", alloc[i]);
        
    for (i = 0; i < r; i++)
        avl[i] = max_res[i] - alloc[i];
 
    printf("\nAvailable resources: ");
    for (i = 0; i < r; i++)
        printf("%d ", avl[i]);
    printf("\n");
 //===================LOGIC===========================
 
    while (count != 0) {
        safe = false;
        for (i = 0; i < p; i++) {
            if (process[i]) {
                exec = 1;
                for (j = 0; j < r; j++) {
                    if (maxABC[i][j] - curntABC[i][j] > avl[j]) {
                        exec = 0;
                        break;
                    }
                }
 
                if (exec) {
                    printf("\nProcess%d is executing.\n", i + 1);
                    process[i] = 0;
                    count--;
                    safe = true;
                    for (j = 0; j < r; j++)
                        avl[j] += curntABC[i][j];
                    break;
                }
            }
        }
 
        if (!safe) {
            printf("\nThe processes are in unsafe state.");
            break;
        }
 
        if (safe)
            printf("\nThe process is in safe state.");
 
        printf("\nAvailable : ");
        for (i = 0; i < r; i++)
            printf("%d ", avl[i]);
    }
 //=========================END-LOGIC=====================
    return 0;
}



int NoNeedtoTakeintput(){
	
	int alloABC[10][10]= {{0,1,0},{2,0,0},{3,0,2},{2,1,1},{0,0,2}};
	int maxABC[10][10]={{7,5,3},{3,2,2},{9,0,2},{2,2,2},{4,3,3}};
	int process[5]={1,2,3,4,5};
	int avalABC[10]={3,3,2};
	int needABC[10][10];
	int alloc[5] = {0, 0, 0, 0, 0};
	int max_res[10]={10,5,7};
	
	int i,j,exec;
	int count=0;
	bool safe = false;
	
	for(i=0;i<5;i++){
		for(j=0;j<3;j++){
			needABC[i][j]=maxABC[i][j]-alloABC[i][j];
		}
	}
	
	//====================PRINT-Process============
	printf("Process: ");
	for(i=0;i<5;i++){
		
		printf("P%d\t",process[i]);
	}
	
	//=====================PRINT-Allocation=============
	 printf("\n\n  Allocation:\n  A     B     C\n\n");
	for(i=0;i<5;i++){
		for(j=0;j<3;j++){
			printf("  %d   ",alloABC[i][j]);
		}
		printf("\n");
	}
	
	//=======================PRINT-MAX-ABC================
	
	 printf("\n\n  Maximum:\n  A     B     C\n\n");
	for(i=0;i<5;i++){
		for(j=0;j<3;j++){
			printf("  %d   ",maxABC[i][j]);
		}
		printf("\n");
	}
	
	
	
	//=====================PRINT-REMAINING=====================
	 printf("\n\n  Remaining:\n  A     B     C\n\n");
	for(i=0;i<5;i++){
		for(j=0;j<3;j++){
			printf("  %d   ",needABC[i][j]);
		}
		printf("\n");
	}
	
	    for (i = 0; i < 5; i++)
        	for (j = 0; j < 3; j++)
           	 alloc[j] += alloABC[i][j];
        
        printf("\nAllocated resources: ");
    	for (i = 0; i < 3; i++)
        	printf("%d ", alloc[i]);
        	
        for (i = 0; i < 3; i++)
        	avalABC[i] = max_res[i] - alloc[i];
        
        printf("\nAvailable resources: ");
        
    for (i = 0; i < 3; i++)
        printf("%d ", avalABC[i]);
    printf("\n");
	
	 //===================LOGIC===========================
 	count=5;
    while(count != 0) {
        safe = false;
        printf("SafePattern:");
        for (i = 0; i < 5; i++) {
            if (process[i]) {
                exec = 1;
                for (j = 0; j < 3; j++) {
                    if (needABC[i][j] > avalABC[j]) {
                        exec = 0;
                        break;
                    }
                }
 
                if (exec) {
                	printf("p%d->",i+1);
                    printf("\nProcess%d is executing.\n", i+1 );
                    process[i] = 0;
                    count--;
                    safe = true;
                    for (j = 0; j < 3; j++)
                        avalABC[j] += alloABC[i][j];
                    break;
                }
            }
            
        }
        
 
        if (!safe) {
        	
            printf("\nThe processes are in unsafe state.");
            break;
        }
 
        if (safe)
            printf("The process is in safe state.");
 
        printf("\nAvailable : ");
        for (i = 0; i < 3; i++)
            printf("%d ", avalABC[i]);
            printf("\n\n");
            
    }
	
	return 0;
}

int main(){
	
	
	printf("============================\n");
	int choice,a;
	printf("1.  If u want use Without user input.\n    press 1.\n");
	printf("2.  If u want use With user input.\n    press 2.");
printf("Enter your no");
scanf("%d",&a);
 if(a==1){
 	NoNeedtoTakeintput();
 }
 else{
 	userinput();
 }
 


	
	
	return 0;
}
