#ifndef __ENGINE_H__
#define __ENGINE_H__

#include <stdbool.h>

struct sfRenderWindow;

typedef bool cell_t;

typedef struct GameSpace {
    unsigned long long Size;
    cell_t* Cells;
} GameSpace;

int initGameSpace (GameSpace*, unsigned long long, bool);
void destroyGameSpace (GameSpace *);
int newTurn (GameSpace *);

#endif