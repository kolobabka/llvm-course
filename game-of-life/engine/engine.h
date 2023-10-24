#ifndef __ENGINE_H__
#define __ENGINE_H__

#include <stdbool.h>

struct sfRenderWindow;

typedef bool cell_t;

#define WINDOW_SIZE 800

void initGameSpace (cell_t *);
int newTurn (cell_t *);

#endif