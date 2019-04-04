#include<stdio.h>

int tag[8]; //Tag array: for storing tags in the cache

int main()
{
	int addr;           //address
	int i, t;           //index, tag
	int hits, accesses; //#hits, #accesses
	FILE *fp;           
	
	fp = fopen("trace.txt", "r");       //Accessing trace.txt using pointer
	
	hits = 0;           //initialization
	accesses = 0;
	
	while(fscanf(fp, "%x", &addr) > 0)
	{
		accesses++;                  //incrementing the #accesses
		printf("%3d: 0x%08x ", accesses, addr); //printing the #accesses and the new address
		
		//The bits in positions 0 and 1 are offset bits
		i = (addr >> 2) & 7; //The bits in position 2, 3 and 4 are the index
		t = addr | 0x1f; //The bits 5 - 31 are the tag bits
		

		if(tag[i] == t) //Checking for a hit
		{
			hits ++; // incrementing the #hits
			printf("Hit%d ",i);
		}
		else //Otherwise its a miss
		{
			printf("Miss ");
			tag[i] = t;
		}
		
		for(i = 0;i < 8;i++) //printing the tag array data
		{
			printf("0x%08x\n", tag[i]);
		}
	}
	printf("Hits = %d, Accesses = %d, Hit rate = %f\n", hits, accesses, (float)hits / accesses); // Print the number of hits, number of accesses and the hit rate
	fclose(fp); // close the file used
	return 0;
}
