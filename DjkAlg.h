#ifndef DJKALG_H_
#define DJKALG_H_

#include <utility>
#include <map>
#include <fstream>
#include <iostream>
#include <string>
#include <queue>

using namespace std;

struct MyComparison
{
	//Used to allow the priority queue to compare the weighted edge value and not the node value.
	bool operator() (pair<int, int> p1, pair<int, int> p2)
	{
		return (p1.second > p2.second);
	}
};

class DjkAlg {
public:
	DjkAlg();
	void setGraph();
	void printPath();
	void printAdjacencyList();
	void dijkstra();
	~DjkAlg();

private:
	int nodes, edges, source, sink;
	string fileName;
	priority_queue< pair<int, int>, vector<pair<int, int> >, MyComparison> pQueue;
	map<int, vector<pair<int, int>>> edgeMap;
	int * distance;
	int * predecessor;
	vector<int> explored;
	vector<int> path;
	ifstream inFile;

};
#endif // !DJKALG_H_

