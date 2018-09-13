#include "TicTacToe.h"
#include <iostream>

using namespace std;

TicTacToe::TicTacToe()
{
	cout << "\t Welcome to tic-tac-toe!" << endl;
	cout << "\t Where you are the X's and we are the O's!!!\n" << endl;

	for (int i = 0; i < 9; i++) {
		board[i] = i+48;
	}

	maxToken = 88;
	minToken = 79;
	playDepth = 0;
	optimin = 0;

}

bool TicTacToe::gameOver()
{
	if (playDepth == 9) {
		return true;
	}
	else { 
		return false;
	}
}

int TicTacToe::gameWon()
{
	//  Row One Check
	if (board[0] == board[1] && board[1] == board[2]) { 
		if (board[1] == 'X') { return 1; }
		else { return -1; }
	} 
	//  Row Two Check
	else if (board[3] == board[4] && board[4] == board[5]) {
		if (board[4] == 'X') { return 1; }
		else { return -1; }
	}
	//  Row Three Check
	else if (board[6] == board[7] && board[7] == board[8]) {
		if (board[7] == 'X') { return 1; }
		else { return -1; }
	}
	//  Column One Check
	else if (board[0] == board[3] && board[3] == board[6]) {
		if (board[3] == 'X') { return 1; }
		else { return -1; }
	}
	//  Column Two Check
	else if (board[1] == board[4] && board[4] == board[7]) {
		if (board[4] == 'X') { return 1; }
		else { return -1; }
	}
	//  Column Three Check
	else if (board[2] == board[5] && board[5] == board[8]) {
		if (board[5] == 'X') { return 1; }
		else { return -1; }
	}
	//  Diag Check (1,1) - (3,3)
	else if (board[0] == board[4] && board[4] == board[8]) {
		if (board[4] == 'X') { return 1; }
		else { return -1; }
	}
	// Diag Check (3,3) - (1,1)
	else if (board[2] == board[4] && board[4] == board[6]) {
		if (board[4] == 'X') { return 1; }
		else { return -1; }
	}
	else { return 0; }
}

void TicTacToe::playGameHuman()
{
	int tempPlay = 0;

	cout << "\t Player X: please select your move by choosing an available number!\t";
	cin >> tempPlay;

	if (board[tempPlay] == (tempPlay + 48)) {
		board[tempPlay] = 'X';
	}
	else { cout << "\t Sorry! that position was not allowed, please try again. " << endl; 
		playGameHuman();
	}
	
	playDepth++;
}

void TicTacToe::playGameComputer()
{
	if (gameOver() == true) {
		return;
	}

	int temp = minimax(minToken, board, optimin, playDepth);

	board[optimin] = 'O';

	playDepth++;

}

void TicTacToe::printBoard()
{
	cout << endl;
	cout << '\t' << board[0] << " | " << board[1] << " | " << board[2] << endl;
	cout << "\t ---------- " << endl;
	cout << '\t' << board[3] << " | " << board[4] << " | " << board[5] << endl;
	cout << "\t ---------- " << endl;
	cout << '\t' << board[6] << " | " << board[7] << " | " << board[8] << endl;
	cout << endl;
}

int TicTacToe::minimax(char a, char b[9], int c, int d)
{
	int score = 0;
	int maxScore = -1;
	int minScore = 1;
	int depth = d;

	if (gameWon() > 0) {
		return 1;
	}
	else if (gameWon() < 0) {
		return -1;
	}
	else if (d == 9) {
		return 0;
	}

	// Computer move simulation.

	for (int i = 0; i < 9; i++) {

		//  If position empty, take move.
		if (board[i] == i + 48) {

			//  Simulate Max's Move
			if (a == maxToken) {
				b[i] = 'X';
				score = minimax(minToken, board, optimin, 1+depth);
				b[i] = i + 48;
				if (score > maxScore) {
					maxScore = score;
				}
			}
			// Simulate Min's Move
			if (a == minToken) {
				b[i] = 'O';
				score = minimax(maxToken, board, optimin, 1+depth);
				b[i] = i + 48;
				if (score < minScore) {
					minScore = score;
					if (depth == playDepth) {
						optimin = i; // Keeping track of optimum playing position.
					}
				}
			}
		}
	}

	if (a == maxToken) {
		return maxScore;
	}
	if (a == minToken) {
		return minScore;
	}

}
