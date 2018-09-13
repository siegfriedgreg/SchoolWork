#ifndef KRUSALG_H_
#define KRUSALG_H_

#include <fstream>
#include <iostream>
#include <string>
#include <queue>
#include <vector>

using namespace std;

struct Edge {

	// Used to store the complete edge grouping.
	int node1, node2, wght;
	// Constructor
	Edge(int e1, int e2, int w) : node1(e1), node2(e2), wght(w) {}
	// Define Assignments.
	void operator = (const Edge &t) {
		node1 = t.node1;
		node2 = t.node2;
		wght = t.wght;
	}

};

struct MyComparison {

	//Used to allow the priority queue to compare the weighted edge value and not the node value.
	bool operator() (Edge p1, Edge p2)
	{
		return (p1.wght > p2.wght);
	}

};

class KrusAlg {

public:
	KrusAlg();
	int find(int x);
	void setGraph();
	void printPath();
	void kruskal();
	void unionSets(int root1, int root2);
	void unionEdge(int x, int y);
	~KrusAlg();

private:
	int nodes, edges, source, sink;
	string fileName;
	priority_queue<Edge, vector<Edge>, MyComparison> pQueEdge;
	vector<Edge> mst;
	vector<int> sets;
	ifstream inFile;
};

#endif // !KRUSALG_H_

