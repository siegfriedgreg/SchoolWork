#ifndef TICTACTOE_H
#define	TICTACTOE_H

class TicTacToe {
public:
	TicTacToe();
	bool gameOver();
	int gameWon();
	void playGameHuman();
	void playGameComputer();
	void printBoard();
	int minimax(char a, char b[9], int c, int d);

private:
	char board[9];
	char maxToken;
	char minToken;
	int playDepth;
	int optimin;

};
#endif // !TICTACTOE_H

