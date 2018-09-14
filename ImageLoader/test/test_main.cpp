#include "../include/ImageLoader.h"
#include "../include/PXM.h"
#include "../src/ImageLoader.cpp"
#include "../src/PXM.cpp"
#include <fstream>
#include <iomanip>
#include <iostream>
#include <string>

using namespace std;

void errorMessage(){

    cout << endl;
    cout << "\t   ****** ERROR ****** " << endl;
    cout << "\tIncorrect file nameing, please try: " << endl;
    cout << "\t  ./ImageLoader -i [filename] -o [filename] [options] " << endl;
    cout << "\tOPTIONS: " << endl;
    cout << "\t  '-c' = To Copy image " << endl;
    cout << "\t  '-fC' = To find Connected-Components" << endl;
    cout << "\t  '-g 1.5' = To Gamma correct (0-2)" << endl;
    cout << "\t  '-pL 45' = To lighten Pixel (0-100)" << endl;
    cout << "\t  '-pD 74' = To darken Pixel (0-100)" << endl;
    cout << endl;
    cout << "\t   ****** EXIT! ****** " << endl;
    cout << endl;

}

int main(int argc, char **argv)
{
	if (argc < 5)
	{
                errorMessage();
	        exit(1);
	}
// #########
	char *inputFileName = 0, *outputFileName = 0;

	for (int i = 1; i < argc; i++)
	{
		if (i + 1 != argc)
		{
			if (!strcmp(argv[i], "-i"))
			{
				inputFileName = argv[i + 1];
			}
			if (!strcmp(argv[i], "-o"))
			{
				outputFileName = argv[i + 1];
			}
			
		}
	}
// ##########
	PXM img1(inputFileName);

	for (int i = 1; i < argc; i++)
	{
                if (!strcmp(argv[i], "-c"))
		{
			img1.saveImageData(outputFileName);
                        return 0;
		}
                if (!strcmp(argv[i], "-fC"))
		{
			img1.RecursiveConnectedComponents();
                        img1.saveImageData(outputFileName);
                        return 0;	
		}
		if (i + 1 != argc)
		{

			if (!strcmp(argv[i], "-g"))
			{
				double temp = stod(argv[i + 1]);
                                img1^temp;
                                img1.saveImageData(outputFileName);
                                return 0;
			}
			if (!strcmp(argv[i], "-pL"))
			{
				double temp = stoi(argv[i + 1]);
                                img1 - temp;
                                img1.saveImageData(outputFileName);
                                return 0;
			}
                        if (!strcmp(argv[i], "-pD"))
			{
				double temp = stoi(argv[i + 1]);
                                img1 + temp;
                                img1.saveImageData(outputFileName);
                                return 0;
			}			
		}
	}
                        
	errorMessage();
	exit(1);
}
