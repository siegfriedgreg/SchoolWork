#include "../include/ImageLoader.h"
#include "../include/PXM.h"
#include <fstream>
#include <iomanip>
#include <iostream>
#include <cmath>

ImageLoader::ImageLoader()
{
	
}
ImageLoader::ImageLoader(ImageLoader& img)
{
	mWidth = img.mWidth;
	mHeight = img.mHeight;
	mImageSize = img.mImageSize;
	mBytsPerPixel = img.mBytsPerPixel;
	mImageDepth = img.mImageDepth;

	*this = img;
}
const ImageLoader& ImageLoader::operator =(const ImageLoader& img)
{
	if (mImageData != NULL)
	{
		delete[] mImageData;
	}

	mImageData = new unsigned char[mImageSize * mImageDepth];

	for (int i = 0; i < mImageSize * mImageDepth; i++)
	{
		mImageData[i] = img.mImageData[i];
	}

	return *this;
}
const ImageLoader& ImageLoader::operator +(int value)
{
	int pixelValue = 0;

	for (int i = 0; i < mImageSize * mImageDepth; i++)
	{
		pixelValue = mImageData[i] + value;
		if (pixelValue > mBytsPerPixel)
		{
			mImageData[i] = mBytsPerPixel;
		}
		else
			mImageData[i] = pixelValue;
	}

	return *this;
}
const ImageLoader& ImageLoader::operator -(int value)
{
	int pixelValue = 0;

	for (int i = 0; i < mImageSize * mImageDepth; i++)
	{
		pixelValue = mImageData[i] - value;
		if (pixelValue < 0)
		{
			mImageData[i] = 0;
		}
		else
			mImageData[i] = pixelValue;
	}

	return *this;
}
const ImageLoader& ImageLoader::operator ^(double value)
{
	for (int i = 0; i < mImageSize * mImageDepth; i++)
	{
		int pixelValue = 0;

		pixelValue = mBytsPerPixel * pow((mImageData[i] / (double)mBytsPerPixel), value);

		if (pixelValue > mBytsPerPixel)
		{
			mImageData[i] = mBytsPerPixel;
		}
		else
			mImageData[i] = pixelValue;
	}
	return *this;
}
ImageLoader::~ImageLoader()
{
	if (mImageData != NULL)
	{
		delete[] mImageData;
	}
	mImageData = NULL;
}
