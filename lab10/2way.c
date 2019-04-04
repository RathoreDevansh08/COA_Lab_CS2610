#include<stdio.h>

int tag[4][2];
int mru[4] = {1, 1, 1, 1};

int main()
{
	int addr; 
	int hits, accesses;
	FILE *fp;
	
	fp = fopen("trace.txt", "r");
	hits = 0;
	accesses = 0;
	while(fscanf(fp, "%x", &addr) > 0)
	{
		//Cache design::
		//Two offset bits - 0, 1
		//Two index bits - 2, 3
		//28 tag bits - [4,31]

		accesses++; // incrementing the number of accesses.
		int ind = (addr>>2)&3; //index
		
		int k;
		int tg = addr | 0xf; //tag
		
		//searching for that particular tag value
		for(k = 0;k < 2;k++) //iterates through the set corresponding to 'ind' index.
		{
			if(tag[ind][k] == tg) //For checking if Tag is in the kth way of the ind set or not.
			{
				printf("Its a Hit");
				mru[ind] = k;
				hits++;
				break;
			}
		}
		
		if(k == 2) //Checking if Tag was not found, hence its a miss
		{
			printf("Its a Miss");
			//least recently used way corresponding to the ind set
			int x = (mru[ind] + 1)%2;
			//Updating the tag value
			tag[ind][x] = tg;
			//Changing the mru for this set to the way used now 
			mru[ind] = x; 
		}
		
		for(int i = 0;i < 4;i++) //Printing the array
		{
			printf(" 0x%08x 0x%08x\n",tag[i][0], tag[i][1]);
		}

		for(int i = 0;i < 4;i++) //Printing the mru array
			printf("%d ", mru[i]);
		printf("\n");
	}
	
	printf("Hits = %d, Accesses = %d, Hit ratio = %f\n", hits, accesses, (float)hits/accesses);
	fclose(fp);
	return 0;
}
