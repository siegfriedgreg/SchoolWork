/*
 *      Author: Greg Siegfried
 *      Date ( MM/YYYY ): 11/2017
 *
	This is a very simple tictactoe game that uses the minmax algorithm to
	recursively find the best move for the computer player.  

	Human player is the X and the computer player is the O, with X's going first.
	Select an open square from 0-8.

	To play again type y or Y, anything else will exit.

	compiled on Ubuntu 18.04, with g++ and c++11.
*/
#include "TicTacToe.h"
#include "TicTacToe.cpp"
#include <iostream>

using namespace std;

int main() {

        char response1 = 'Y';
	char response2 = 'y';
        char inputResponse = 'y';

	do {
	    
            TicTacToe game1;
	    	
	    while ((game1.gameWon() == 0) && (game1.gameOver() == false)){
		    game1.printBoard();
		    game1.playGameHuman();
		    game1.playGameComputer();
	    }

	    if (game1.gameOver() == true) {
		    cout << "\t We will just have to call it a drawn now wont we? " << endl;
	    }
	    else if (game1.gameWon() == 1) {
		    cout << "\t That was some inmpressive crossing with those X's! " << endl;
	    }
	    else if (game1.gameWon() == -1) {
		    cout << "\t Dont cry, you can always try again. " << endl;
	    }
	    else {
	  	    cout << " \t I'm not sure what happend. :( " << endl;
	    }
	    cout << endl;
	    cout << "Play again? y/n" << endl;
	    cin >> inputResponse;
	    cout << endl;

        }while( (inputResponse == response1) || (inputResponse == response2) );

	cout << "Come back and play soon!" << endl;
	return 0;
}
