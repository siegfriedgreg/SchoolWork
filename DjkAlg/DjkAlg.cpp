#include "DjkAlg.h"
#include <climits>
#include <algorithm>

DjkAlg::DjkAlg()
{
	nodes = 0; edges = 0; sink = 0; source = 0;
	fileName = "";

	cout << "Enter the file name for the graph.\n";
	getline(cin, fileName);

}

// Read in # of nodes, # of edges, source, sink, and the map of nodes to nodes w/ weight in that order.
void DjkAlg::setGraph()
{
	inFile.open(fileName.c_str());
	if (inFile.fail())
	{
		cout << "Unable to open file.\n";
		exit(1);
	}

	inFile >> nodes >> edges >> source >> sink;

     // Creates pointer array for distance.
	distance = new int[nodes]; 
     // Creates predecessor array for list of preceeding nodes.
	predecessor = new int[nodes]; 

	for (int i = 0; i < nodes; i++)
	{
             // Sets default values to maximum of int values.
		distance[i] = INT_MAX; 
             // Sets default values to negative 1.
		predecessor[i] = -1; 
	}

	distance[source] = 0; // Sets source node to 0.

	for (int i = 0; i < nodes; i++)
	{
		// Pairs the node and its starting distances into the priority queue.
		pQueue.push(make_pair(i, distance[i]));
	}

     // Push in source node pair.
	pQueue.push(make_pair(source, 0)); 

     // temp values for stream input.
	int u, v, d;

	while (inFile >> u >> v >> d)
	{
             // Make nodes and map edges.
		edgeMap[u].push_back(make_pair(v, d));
             // Make neighbor pair.
		edgeMap[v].push_back(make_pair(u, d));
	}

     // close the input file stream.
	inFile.close(); 

}


// Print the shortest path from source to sink using predecessor array.
void DjkAlg::printPath()
{
	int node = predecessor[sink];

	if (node == -1)
	{
		cout << "Path not found.\n";
		return;
	}

	path.push_back(sink);

	while (node != -1)
	{
		path.push_back(node);
		node = predecessor[node];
	}

	cout << endl;
	cout << "The shortest path from " << source << " to " << sink << " is:\n";

	for (int i = (path.size() - 1); i > 0; i--)
	{
		cout << path[i] << " -> ";
	}
	cout << sink << endl;

	cout << "With a distance of " << distance[sink] << endl;
}

// Print the adjacency list.
void DjkAlg::printAdjacencyList()
{
	cout << "The graph has " << nodes << " nodes and " << edges << " edges.\n";
	cout << "The source node is " << source << " and the sink node is " << sink << endl;
	cout << endl;
	cout << "Node  Neighbors" << endl;
	for (int i = 0; i < nodes; i++)
	{
		cout << i << ":    ";
		for (unsigned int j = 0; j < edgeMap[i].size(); j++)
		{
			cout << "[" << edgeMap[i][j].first << "," << edgeMap[i][j].second << "] ";
		}
		cout << endl;
	}
}

// Find the shortest path from source to sink.
void DjkAlg::dijkstra()
{
	while (!pQueue.empty())
	{
             // Set temp to current low weighted node value.
		pair<int, int> temp = pQueue.top(); 

             // Set u to the node value of the pair.
		int u = temp.first;
             // Remove the top value in the priority queue.
		pQueue.pop();

             // Search explored list for current u value, and continue if not found.
		if (find(explored.begin(), explored.end(), u) != explored.end())
			continue;

		for (unsigned int j = 0; j < edgeMap[u].size(); j++)
		{
		     // Set a test pair of u and an iterated j.
			pair<int, int> test = edgeMap[u][j];
                     // v is the same node as u.
			int v = test.first;
                     // dd becomes the current node weight.
			int dd = test.second; 
// Checks if the distance at v is greater than its current edge weight plus previous node distance. When TRUE: 1) Sets the distance of v equal to the distance of u plus edge weight. 2) Sets predecessor of v equal to the previous node u. 3) Then push the pair of v and its new distance to the priority queue.
			if (distance[v] >(dd + distance[u]))
			{
				distance[v] = distance[u] + dd;  //  1
				predecessor[v] = u;  //  2
				pQueue.push(make_pair(v, distance[v]));  //  3
			}
		}

             // Sends u to the explored list.
		explored.push_back(u);
	}
}

DjkAlg::~DjkAlg()
{
	// Destructor
}
