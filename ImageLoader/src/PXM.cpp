#include "../include/PXM.h"
#include "../include/ImageLoader.h"
#include <fstream>
#include <iomanip>
#include <iostream>
#include <cmath>
#include <cstring>

using namespace std;

const int MAX_LINE_CHAR = 1024;
const int UNLABELED_PIXEL = 100;

PXM::PXM()
{

}
PXM::PXM(char *filename)
{
	ifstream inData;
	inData.open(filename, ios::in | ios::binary);

	if (inData.fail())
	{
		cout << "File failed to load!" << endl;
		exit(1);
	}

	// Get Magic Number
	char magicNumber[100];
	inData.getline(magicNumber, 100);
	//cout << "Image type: " << magicNumber;

	if (!strcmp(magicNumber, "P2"))
	{
		mImgType = P2;
	}
	if (!strcmp(magicNumber, "P3"))
	{
		mImgType = P3;
	}
	if (!strcmp(magicNumber, "P5"))
	{
		mImgType = P5;
	}
	if (!strcmp(magicNumber, "P6"))
	{
		mImgType = P6;
	}

	//Get Width and Height
	char c = inData.peek();
	char lineBuf[MAX_LINE_CHAR];
	while (c == '#')
	{
		inData.getline(lineBuf, MAX_LINE_CHAR);
		c = inData.peek();
		//cout << "Comment: " << lineBuf << endl;
	}

	inData >> mWidth >> mHeight;
	inData >> mBytsPerPixel;

	mImageSize = mWidth * mHeight;

	// Magic Number Selects Data Extraction
	switch (mImgType)
	{
	case P2:
		// PGM ASCII
		mImageDepth = 1;
		mImageData = new unsigned char[mImageSize * mImageDepth];
		for (int i = 0; i < mImageSize; i++)
		{
			int pixelData = 0;
			inData >> pixelData;
			mImageData[i] = pixelData;
		}
		break;
	case P3:
		// PPM ASCII
		mImageDepth = 3;
		mImageData = new unsigned char[mImageSize * mImageDepth];
		for (int i = 0; i < mImageSize * 3; i++)
		{
			int pixelData = 0;
			inData >> pixelData;
			mImageData[i] = pixelData;
		}
		break;
	case P5:
		// PGM BINARY
		mImageDepth = 1;
		mImageData = new unsigned char[mImageSize * mImageDepth];
		inData.read((char *)mImageData, mImageSize);
		break;
	case P6:
		// PPM BINARY
		mImageDepth = 3;
		mImageData = new unsigned char[mImageSize * mImageDepth];
		inData.ignore(1, '\n');
		inData.read((char *)mImageData, mImageSize * mImageDepth);
		break;
	default:
		cout << "Image Type not found! " << endl;
		break;
	}

	inData.close();
}
PXM::PXM(PXM& img) : ImageLoader::ImageLoader(img)
{
	mImgType = img.mImgType;
	
	*this = img;
}
void PXM::saveImageData(char *filename)
{
	ofstream outData;
	outData.open(filename, ios::out | ios::binary);

	// Magic Number Selects Header And File Data For Saveing
	switch (mImgType)
	{
	case P2:
		// PGM ASCII
		outData << "P2" << endl;
		outData << "# 1525 Homework" << endl;
		outData << mWidth << " " << mHeight << " " << mBytsPerPixel << endl;
		for (int i = 0; i < mImageSize; i++)
		{
			int pixelValue = 0;
			pixelValue = mImageData[i];
			outData << pixelValue << " ";
		}
		break;
	case P3:
		// PPM ASCII
		outData << "P3" << endl;
		outData << "# 1525 Homework" << endl;
		outData << mWidth << " " << mHeight << " " << mBytsPerPixel << endl;
		for (int i = 0; i < mImageSize * mImageDepth; i++)
		{
			int pixelValue = 0;
			pixelValue = mImageData[i];
			outData << pixelValue << " ";
		}
		break;
	case P5:
		// PGM BINARY
		outData << "P5";
		outData << "# 1525 Homework" << endl;
		outData << mWidth << " " << mHeight << endl;
		outData << mBytsPerPixel << endl;
		outData.write((char *)mImageData, mImageSize * mImageDepth);
		break;
	case P6:
		// PPM BINARY
		outData << "P6" << endl;
		outData << "# 1525 Homework" << endl;
		outData << mWidth << " " << mHeight << endl;
		outData << mBytsPerPixel << endl;
		outData.write((char *)mImageData, mImageSize * mImageDepth);
		break;
	default:
		cout << "Output file type not found " << endl;
		break;
	}

	outData.close();
}
void PXM::RecursiveConnectedComponents()
{
	label = 1;
	FindComponents(label);
}
void PXM::FindComponents(int label)
{

	for (int y = 0; y < mHeight; y++)
	{
		for (int x = 0; x < mWidth; x++)
		{
			int index = mImageDepth * ((y * mWidth) + x);

			if (x > 0 && y > 0 && x <= mWidth && y <= mHeight)
			{

				if (mImageData[index] >= UNLABELED_PIXEL && mImageData[index + 1] >= UNLABELED_PIXEL &&
					mImageData[index + 2] >= UNLABELED_PIXEL)
				{
					label++;
					Search(label, x, y);
				}
			}
		}
	}
	// Start Color Searching
	ColorComponents(label);
}
void PXM::Search(int label, int x, int y)
{
	int index = mImageDepth * ((y * mWidth) + x);

	mImageData[index] = label;
	mImageData[index + 1] = label;
	mImageData[index + 2] = label;

	for (int xoff = -1; xoff <= 1; xoff++)
	{
		for (int yoff = -1; yoff <= 1; yoff++)
		{
			int newx = x + xoff;
			int newy = y + yoff;

			int newIndex = mImageDepth * (newy *mWidth + newx);

			if ((newIndex < mImageDepth * mImageSize) && (newIndex > 0))
			{
				if (mImageData[newIndex] >= UNLABELED_PIXEL && mImageData[newIndex + 1] >= UNLABELED_PIXEL &&
					mImageData[newIndex + 2] >= UNLABELED_PIXEL)
				{
					Search(label, newx, newy);
				}
			}
		}
	}
}
void PXM::ColorComponents(int label)
{
	do
	{
		for (int i = 0; i < mImageSize*mImageDepth; i++)
		{
			if (mImageData[i] == label && mImageData[i + 1] == label && mImageData[i + 2] == label)
			{
				colorValue = label % 6 + 1;
				switch (colorValue)
				{
				case 1: //RED
					mImageData[i] = 255;
					mImageData[i + 1] = 0;
					mImageData[i + 2] = 0;
					break;
				case 2: //GREEN
					mImageData[i] = 0;
					mImageData[i + 1] = 255;
					mImageData[i + 2] = 0;
					break;
				case 3: //BLUE
					mImageData[i] = 0;
					mImageData[i + 1] = 0;
					mImageData[i + 2] = 255;
					break;
				case 4: //FUSCHIA
					mImageData[i] = 255;
					mImageData[i + 1] = 0;
					mImageData[i + 2] = 255;
					break;
				case 5: //SKYBLUE
					mImageData[i] = 0;
					mImageData[i + 1] = 255;
					mImageData[i + 2] = 255;
					break;
				case 6: //YELLOW
					mImageData[i] = 255;
					mImageData[i + 1] = 255;
					mImageData[i + 2] = 0;;
					break;
				}
			}
		}label--;
	} while (label > 1);
}
PXM::~PXM()
{
	if(mImageData != NULL)
	{
		delete[] mImageData;
	}
	mImageData = NULL;
}
