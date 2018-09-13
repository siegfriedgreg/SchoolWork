/*
    Author: Greg Siegfried
    Date (MM/YYYY): 03/2017

    Application of Kruskals Algorithm on simple text files.
    The file lists:
        Nodes Edges
        Source Sink
        Node1 Node2 Weight
        Node3 Node4 Weight
        ...   ...   ...

    Input files used for testing are:
        KA-Graph1.txt
        KA-Graph2.txt
	KA-Graph3.txt

*/
#include "KrusAlg.h"
#include "KrusAlg.cpp"
#include <iostream>

int main()
{
	KrusAlg kA;
	kA.setGraph();
	kA.kruskal();
	kA.printPath();

	return 0;
}
