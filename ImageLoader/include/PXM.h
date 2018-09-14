#ifndef PXM_H_
#define PXM_H_

#include "ImageLoader.h"

enum ImageType { P2, P3, P5, P6 };

class PXM : public ImageLoader
{
public:
	PXM(); // Constructor
	PXM(char *filename); // Open file and pull all data of file type.
	PXM(PXM& img); // Returns the reference of the pointer?

	void saveImageData(char *filename); // Saves file data under filename.

	void RecursiveConnectedComponents(); //Calls FindComponents.
	void FindComponents(int label); // Calls ColorComponents when completed.
	void ColorComponents(int label); // Rotates between 6 different colors.
	void Search(int label, int x, int y); // Recursive search for connected components.
	~PXM(); // Destructor
private:
	int colorValue, label, countInt;
	ImageType mImgType;
};


#endif

