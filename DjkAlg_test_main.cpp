/*
    Author: Greg Siegfried
    Date (MM/YYYY): 02/2018

    Dijkstra's algorithm that works on text input files.
    Input File Format goes as follows:
    Nodes Edges
    Source Sink
    Node1 Node2 Weight
    Node3 Node4 Weight
     ...   ...   ...

    Compiled and run with g++, c++11, on Ubuntu 18.04

*/



#include "DjkAlg.h"
#include "DjkAlg.cpp"

int main()
{
	DjkAlg dA;
	dA.setGraph();
	dA.printAdjacencyList();
	dA.dijkstra();
	dA.printPath();


	return 0;
}
