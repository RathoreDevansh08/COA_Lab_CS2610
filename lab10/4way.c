#include<stdio.h>

// The first index of the tag array is the 'index'
// The second index of the tag array is the 'way'
int tag[2][4];
int mru[2][4] = {{3, 2, 1, 0}, {3, 2, 1, 0}};
// This stores the ways for each set in the 
// most recently used order, that is the
// 0th position for a set corresponds to
// the most recently used way, and the 3rd
// position corresponds to the least recently
// used way.


// This function updates the most recently used
// array using the way recently used
void mruUpdate(int set, int way)
{
	int j;
	
	for(j = 0;j < 4;j++) // Finds the position of way in the mru[set] array
	{
		if(mru[set][j] == way)
			break;
	}
	
	 // If the way used is not at the start of the mru[set] array
	 // then shift all the elements which were initially to
	 // the left of the way, one unit to the right
	while(j > 0)
	{
		mru[set][j] = mru[set][j-1];
		j--;
	}
	
	// set the 0th index of mru[set] to the way
	mru[set][0] = way;
}

int main()
{
	int addr; // variable for address
	int hits, accesses; // variables for number of hits and number of accesses
	int i, t, j, x; // variables for index, tag, way, LRU way
	FILE *fp; // file pointer
	
	fp = fopen("trace.txt", "r"); // opening trace.txt
	hits = 0;
	accesses = 0;

	while(fscanf(fp, "%x", &addr) > 0) // While input is present
	{
		// In this cache design we have two offset bits - 0 and 1,
		// one index bit - 2 and 29 tag bits 3 to 31

		i = (addr>>2)&1; // extracting the index from the address
		t = addr | 0x7; // extracting the tag from the address
		
		accesses ++; // incrementing the number of accesses
		for(j = 0;j < 4;j++)
		{
			if(tag[i][j] == t) // If tag is found in the ith set, then it's a hit
			{
				hits++; // incrementing the number of hits
				printf(" Hit\n");
				mruUpdate(i, j); // update the mru array using the way just used
				break;
			}
		}
		
		if(j == 4) // tag is not present in the ith set
		{
			printf(" Miss\n");
			x = mru[i][3]; // set x to the least recently used way in the ith set 
			tag[i][x] = t; // set the tag corresponding to the ith set and xth way to be t
			mruUpdate(i, x); // update the mru array using the way just used
		}
		
		for(i = 0;i < 2;i++) // printing the tag array
		{
			for(j = 0;j < 4;j++)
				printf("0x%08x ", tag[i][j]);
			printf("\n");
		}

		for(i = 0;i < 2;i++) // printing the mru array
		{
			for(j = 0;j < 4;j++)
				printf("%d ", mru[i][j]);
			printf("\n");
		}
	}
	
	printf("Hits = %d, Accesses = %d, Hit ratio = %f\n", hits, accesses, (float)hits/accesses); // printing the number of hits, number of accesses and hit rate
	fclose(fp); // closing the file used
	return 0;
}
