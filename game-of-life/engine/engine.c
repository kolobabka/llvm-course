// #include "game.h"
#include "engine.h"
#include "errors.h"
#include "time.h"

#include <string.h>
#include <stdlib.h>
#include <limits.h>

/*
    set size and allocate memory for game space 
    and (optional) filling the space with random
    values  
*/

int initGameSpace (GameSpace *Space, unsigned long long Size, bool NeedRandomFill) {
    Space->Size = Size;
    Space->Cells = (cell_t *) malloc (Size * Size * sizeof(cell_t));
    if (Space->Cells == NULL)
        return BAD_ALLOC;

    srand(time(NULL));

     for (int I = 0; I < Size; I++)
        for (int J = 0; J < Size; J++)
            Space->Cells[I * Size + J] = rand() % 2;

    return OK;
}

inline void destroyGameSpace (GameSpace *Space) {
    free(Space->Cells);
}

static inline bool hasUpperNeighbour(const GameSpace* Space, int I) {
    return I;
}

static inline bool hasDownNeighbour(const GameSpace* Space, int I) {
    return I != Space->Size - 1;
}

static inline bool hasLeftNeighbour(const GameSpace* Space, int J) {
    return J;
}

static inline bool hasRightNeighbour(const GameSpace* Space, int J) {
    return J != Space->Size - 1;
}

static unsigned countNeighbours(const GameSpace* Space, int I, int J) {
    unsigned totalNeighboursAmount = 0;
    bool hasLeft, hasRight, hasUpper, hasDown;
    hasLeft = hasLeftNeighbour(Space, J);
    hasRight = hasRightNeighbour(Space, J);
    hasUpper = hasUpperNeighbour(Space, I);
    hasDown = hasDownNeighbour(Space, I);

    if (hasLeft) {
        totalNeighboursAmount += Space->Cells[I * Space->Size + J - 1];
        if (hasUpper)
            totalNeighboursAmount += Space->Cells[(I + 1) * Space->Size + J - 1];
        if (hasDown)
            totalNeighboursAmount += Space->Cells[(I - 1) * Space->Size + J - 1];
    }

    if (hasRight) {
        totalNeighboursAmount += Space->Cells[I * Space->Size + J + 1];
        if (hasUpper)
            totalNeighboursAmount += Space->Cells[(I + 1) * Space->Size + J + 1];
        if (hasDown)
            totalNeighboursAmount += Space->Cells[(I - 1) * Space->Size + J + 1];
    }

    if (hasUpper) {
        totalNeighboursAmount += Space->Cells[(I + 1) * Space->Size + J];
    }
    if (hasDown) {
        totalNeighboursAmount += Space->Cells[(I - 1) * Space->Size + J];
    }

    return totalNeighboursAmount;
}

int newTurn (GameSpace *Space) {
    int Unchanged = 0;
    unsigned long long Size = Space->Size;

    cell_t *CellsCopy = malloc(Size * Size * sizeof(cell_t));
    
    memcpy(CellsCopy, Space->Cells, Size * Size);

    for (int I = 0; I < Space->Size; I++)
        for (int J = 0; J < Space->Size; J++) {
            unsigned totalNeighboursAmount = countNeighbours(Space, I, J);
            
            if ((CellsCopy[I * Size + J] == 1) && (totalNeighboursAmount < 2 || totalNeighboursAmount > 3))
                CellsCopy[I * Size + J] = 0;
            else if ((CellsCopy[I * Size + J] == 0) && (totalNeighboursAmount == 3))
                CellsCopy[I * Size + J] = 1;
            else
                Unchanged++;
        }

    if (Unchanged == Size * Size)
        return 0;
    else {
        memcpy(Space->Cells, CellsCopy, Size * Size);
        return 1;
    }
}