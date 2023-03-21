#include "../lib/board.h"
Board::Board(const int &width, const int &height) {
  this->width = width;
  this->height = height;
  this->board = new bool *[height];
  for (int i = 0; i < height; i++) {
    this->board[i] = new bool[width];
    this->move_count = 0;
  }
}

Board::~Board() {
  for (int i = 0; i < this->height; i++) {
    delete[] this->board[i];
  }
  delete[] this->board;
}

void Board::init(const int &num_ships) {
  for (int i = 0; i < num_ships; i++) {
      set_ship();
  }
}
