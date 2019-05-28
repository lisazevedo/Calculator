#include<stdlib.h>
#include<math.h>
#include<stdio.h>

using namespace std;

typedef union { 
  
    float num; 
    struct
    { 
        unsigned int mant : 23; 
        unsigned int exp : 8; 
        unsigned int sign : 1; 
  
    } bin; 
} float32; 

int convertebinario(int dec)
{
int i,q[80],r[80]; 
               
for(i=0;i<80;i++){
	q[i]=0;
	r[i]=0;	
}
i=0;  
  while (dec != 1){   
   q[i]= dec / 2;  
   r[i] = dec % 2; 
   dec=q[i];       
   i++;
   }


  while (i>=0){  
     if (q[i] == 1) printf("1%d",r[i]);
          else printf("%d",r[i]);  
   i--;
   }

return(0);
}


void printFloat(float32 number) 
{ 
  
   
    printf("%d | ", number.bin.sign); 
    convertebinario(number.bin.exp);
    printf(" | "); 
    convertebinario(number.bin.mant);
    printf("\n"); 
} 


int main(int argc, char *argv[]){
	
	float32 number;
	//scanf("%f", &number.num);
	if(argc==1){
		printf("Faltou o numero araguivis!\n!");
		return 0;
	}
	number.num= atof(argv[1]);
	printFloat(number);
	
}
