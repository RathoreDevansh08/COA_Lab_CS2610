#include<stdio.h>

int tag[8]; //Tag array: for storing tags in the cache
int mru[8] = {7, 6, 5, 4, 3, 2, 1, 0}; // The array for most recently used cache spaces
//index 0 -> 7: lesser the index, more it is recent.

void mruUpdate(int way) 
{
	int i;
	for(i = 0;i < 8;i++)
	{
		if(mru[i] == way) //For finding how recent way element was.
			break;
	}
	
	while(i > 0) //for updating the mru list.
	{
		mru[i] = mru[i-1];
		i--;
	}
	
	mru[0] = way; //updating the most recently used element.
}

int main()
{
	int addr;           //address
	int i, t;           //index, tag
	int hits, accesses; //#hits, #accesses
	FILE *fp;  
	
	fp = fopen("trace.txt", "r");   //Accessing trace.txt using pointer
	
	hits = 0;           //initialization
	accesses = 0;
	
	while(fscanf(fp, "%x", &addr) > 0)
	{
		t = addr | 0x3;             //extracting the tag from the address
		accesses ++;                //incrementing the #accesses
		printf("%3d: 0x%08x ", accesses, t); 

		for(i = 0;i < 8;i++) // Searching the tag in the cache
		{
			if(tag[i] == t) //Checking for a hit
			{
				hits ++; // incrementing the #hits
				printf("Hit%d ", i);
				mruUpdate(i); //for updating the mru list
				break;
			}
		}
		
		
		if(i == 8) //condition for miss
		{
			printf("Miss ");
			i = mru[7];          // Get the least recently used way
			tag[i] = t;          // Place the new tag in the way
			mruUpdate(i);        // Place this way at the start of the mru array
		}
		
		for(i = 0; i < 8;i++) //Printing the tag values
		{
			printf("0x%08x\n", tag[i]);
		}
		for(i = 0; i < 8;i++) // Printing the mru array
		{
			printf("%d ", mru[i]);
		}
	}
	
	printf("Hits = %d, Accesses = %d, Hit rate = %f\n", hits, accesses, (float)hits / accesses); // Print the number of hits, number of accesses and the hit rate
	fclose(fp); // close the file used
	return 0;
}
