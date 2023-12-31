#include "sim.h"

#include <string.h>

static inline bool hasUpperNeighbour(int I) {
    return I;
}

static inline bool hasDownNeighbour(int I) {
    return I != WINDOW_SIZE - 1;
}

static inline bool hasLeftNeighbour(int J) {
    return J;
}

static inline bool hasRightNeighbour(int J) {
    return J != WINDOW_SIZE - 1;
}

static unsigned countNeighbours(const cell_t *Cells, int I, int J) {
    unsigned totalNeighboursAmount = 0;
    bool hasLeft, hasRight, hasUpper, hasDown;
    hasLeft = hasLeftNeighbour(J);
    hasRight = hasRightNeighbour(J);
    hasUpper = hasUpperNeighbour(I);
    hasDown = hasDownNeighbour(I);

    if (hasLeft) {
        totalNeighboursAmount += Cells[I * WINDOW_SIZE + J - 1];
        if (hasUpper)
            totalNeighboursAmount += Cells[(I + 1) * WINDOW_SIZE + J - 1];
        if (hasDown)
            totalNeighboursAmount += Cells[(I - 1) * WINDOW_SIZE + J - 1];
    }

    if (hasRight) {
        totalNeighboursAmount += Cells[I * WINDOW_SIZE + J + 1];
        if (hasUpper)
            totalNeighboursAmount += Cells[(I + 1) * WINDOW_SIZE + J + 1];
        if (hasDown)
            totalNeighboursAmount += Cells[(I - 1) * WINDOW_SIZE + J + 1];
    }

    if (hasUpper) {
        totalNeighboursAmount += Cells[(I + 1) * WINDOW_SIZE + J];
    }
    if (hasDown) {
        totalNeighboursAmount += Cells[(I - 1) * WINDOW_SIZE + J];
    }

    return totalNeighboursAmount;
}

static void drawGameSpace(const cell_t *Cells) {
    Color cellColor = {255, 0, 0, 255};

    for (int I = 0; I < WINDOW_SIZE; I++)
        for (int J = 0; J < WINDOW_SIZE; J++)
            if (Cells[I * WINDOW_SIZE + J] == 1)
                setPixel(I, J, cellColor);

    RenderPresent();
}

void app(cell_t *Cells) {
    while(isOpenWindow()) {
        RenderClean();
        int Unchanged = 0;
        cell_t CellsCopy[WINDOW_SIZE * WINDOW_SIZE];
        
        memcpy(CellsCopy, Cells, WINDOW_SIZE * WINDOW_SIZE);

        for (int I = 0; I < WINDOW_SIZE; I++)
            for (int J = 0; J < WINDOW_SIZE; J++) {
                unsigned totalNeighboursAmount = countNeighbours(Cells, I, J);
                unsigned Pos = I * WINDOW_SIZE + J;

                if ((CellsCopy[Pos] == 1) && (totalNeighboursAmount < 2 || totalNeighboursAmount > 3))
                    CellsCopy[Pos] = 0;
                else if ((CellsCopy[Pos] == 0) && (totalNeighboursAmount == 3))
                    CellsCopy[Pos] = 1;
                else
                    Unchanged++;
            }

        if (Unchanged == WINDOW_SIZE * WINDOW_SIZE)
            break;
        
        memcpy(Cells, CellsCopy, WINDOW_SIZE * WINDOW_SIZE);
        drawGameSpace(Cells);
    }
}