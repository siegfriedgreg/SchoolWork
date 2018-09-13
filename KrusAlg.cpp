#include "KrusAlg.h"

#include <iostream>
#include <fstream>
#include <string>
#include <queue>
#include <vector>

using namespace std;

KrusAlg::KrusAlg()
{
	nodes = 0; edges = 0; sink = 0; source = 0;
	fileName = "";

	cout << "Enter the file name for the graph.\n";
	getline(cin, fileName);

}// End KrusAlg::KrusAlg
int KrusAlg::find(int x) {

	if (sets[x] < 0) {
		return x;
	}
	else {
		return sets[x] = find(sets[x]); // Path compression to root node.
	}

}// End KrusAlg::find
void KrusAlg::setGraph() {

	inFile.open(fileName.c_str());

	if (inFile.fail())
	{
		cout << "Unable to open file.\n";
		exit(1);
	}

	// Set int values.
	inFile >> nodes >> edges >> source >> sink;

    // Initialize each node in the vector to -1.
	sets.resize(nodes, -1);

	int u, v, d; // temp values for stream input.

	// Populate priority queue.
	while (inFile >> u >> v >> d) {
		pQueEdge.push(Edge(u, v, d));
	}

	inFile.close(); // close the input file stream.

}// End KrusAlg::setGraph
void KrusAlg::printPath() {

	int sum = 0;

	// Prints minimum spanning tree and sums up their weight.
	cout << "Kruskals Algorithm has chosen the following: \n";
	for (unsigned int i = 0; i < mst.size(); i++) {
		cout << mst[i].node1 <<" -- " << mst[i].node2 << ": " << mst[i].wght << endl;
		sum += mst[i].wght;
	}

	cout << "With a total edge length of: " << sum << endl;
	cout << endl;

}// End KrusAlg::printPath
void KrusAlg::kruskal() {

	while (mst.size() < static_cast<unsigned int>(nodes - 1)){

		// Sets a temp value to the current edge with the least weight.
		Edge temp = pQueEdge.top();

		// Finds out if node1 and node2 belong to the same set.
		int x = find(temp.node1);
		int y = find(temp.node2);

		// If not then union those nodes and add them to the mst.
		if (x != y) {
			unionEdge(temp.node1, temp.node2);
			mst.push_back(temp);
		}

		// Remove the current top edge from the queue.
		pQueEdge.pop();
	}

}// End KrusAlg::kruskal
void KrusAlg::unionSets(int root1, int root2) {
	
	if (sets[root2] < sets[root1]) {
		sets[root1] = root2; // Assign root2 as main root if it is deeper (<).
	}
	else {
		if (sets[root1] == sets[root2]) { // Decrement root1 if equal.
			sets[root1]--;
		}
		sets[root2] = root1; // Assign root1 as main root.
	}

}// End KrusAlg::unionSets
void KrusAlg::unionEdge(int x, int y) {

	// Union Set wrapper, for the elegance.
	unionSets(find(x), find(y));

}// End KrusAlg::unionEdge
KrusAlg::~KrusAlg() {
	// Destructor for aesthetics.
}// End KrusAlg::~KrusAlg
