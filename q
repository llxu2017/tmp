include <stdio.h>
#include <iostream>
#include <ctype.h>
#include <fstream>

using namespace std;

#define COL 24

void main()
{
	FILE *fp;
	unsigned char buf[1024];

	fp = fopen("abc.7z", "rb+");
	ofstream fout;

	fout.open("cod.txt");

	if(fp == NULL) printf("%s", "Cannot find the file\n");

	int rc;

	unsigned long long cnt = 0;

	while((rc = fread(buf, sizeof(unsigned char), COL, fp) != 0))
	{
		int i;
		for(i = 0; i < COL; ++i)
		{
			char c1 = (buf[i] >> 4) & 0x0F;
			char c2 = buf[i] & 0x0F;

			if('0' <= c1 + '0' && c1 + '0' <= '9') c1 += '0';
			else	c1 = c1 + 'A' - 10;

			if('0' <= c2 + '0' && c2 + '0' <= '9') c2 += '0';
			else	c2 = c2 + 'A' - 10;

			if (c1 == 'C')
				c1 = 'H';
			else if (c1 == '1')
				c1 = 'K';
			else if (c1 == '3')
				c1 = 'U';
			else if (c1 == '4')
				c1 = 'R';
			else if (c1 == '5')
				c1 = 'T';
			else if (c1 == '8')
				c1 = 'L';
			else if (c1 == 'A')
				c1 = 'X';
			else if (c1 == 'B')
				c1 = 'P';
			else if (c1 == 'F')
				c1 = 'M';

			if (c2 == 'C')
				c2 = 'H';
			else if (c2 == '1')
				c2 = 'K';
			else if (c2 == '3')
				c2 = 'U';
			else if (c2 == '4')
				c2 = 'R';
			else if (c2 == '5')
				c2 = 'T';
			else if (c2 == '8')
				c2 = 'L';
			else if (c2 == 'A')
				c2 = 'X';
			else if (c2 == 'B')
				c2 = 'P';
			else if (c2 == 'F')
				c2 = 'M';

			printf("%c%c", c1,c2);
			fout << (c1) << (c2);
			if(i < COL-1)
			{
				//printf(" ");
				//fout << " ";
			}
			else
			{
				printf("\n");
				fout << std::endl;
			}
		}
		++cnt;
		//if(cnt % 58 == 0)
			//system("pause");
	}
	std::cout << "Totally how many lines? " << cnt << std::endl;
	fclose(fp);
	fout.close();
}

F0lcsoUMbVpVlrshWEKhxvItMXXYVTARx7cUEV9Oc84yOADxKjNQ1vAigcXReewJy8oXa6g7eAcUpy6mPmLn8mGdJuQwDTpzzdnfJe8NI3QQ8nuKvtze1phvGx3pvdwG