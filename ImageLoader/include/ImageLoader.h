#ifndef IMAGELOADER_H_
#define IMAGELOADER_H_

class ImageLoader
{
public:
	ImageLoader(); // Constructor
	ImageLoader(ImageLoader& img); // Returns the reference of the pointer?

	const ImageLoader& operator =(const ImageLoader& file); // COPY IMAGE
	const ImageLoader& operator +(int value); // BRIGHTEN IMAGE
	const ImageLoader& operator -(int value); // DARKEN IMAGE
	const ImageLoader& operator ^(double value); // GAMMA FUNCTION or BRIGHT/DARK

	virtual ~ImageLoader(); // Destructor

protected:
	int mWidth, mImageSize, mImageDepth, mHeight, mBytsPerPixel;
	unsigned char *mImageData;

};

#endif
