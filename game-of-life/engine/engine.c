#include "engine.h"

extern SDLWindow Win;

int initWindow(const unsigned long long Size, const char *Name) {
    if (!Name) {
        fprintf(stderr, "Need to specify name of window\n");
        return -1;
    }

    Win.Size = Size;
    Win.Window = SDL_CreateWindow(Name, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, Size, Size, /* flags */ 0);
    if (!Win.Window) {
        fprintf(stderr, "Failed to create SDL window\n");    
        return -1;
    }

    Win.Renderer = SDL_CreateRenderer(Win.Window, /* index */ -1, /* flags */ 0);
    if (!Win.Renderer) {
        fprintf(stderr, "Failed to create SDL renderer\n");    
        return -1;
    }

    return 0;
}

void destroyWindow() {
    SDL_DestroyRenderer(Win.Renderer);
    SDL_DestroyWindow(Win.Window);
    SDL_Quit();
}

void initGameSpace (cell_t *Cells) {
    srand(time(NULL));

     for (int I = 0; I < WINDOW_SIZE; I++)
        for (int J = 0; J < WINDOW_SIZE; J++)
            Cells[I * WINDOW_SIZE + J] = rand() % 2;

}

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

static int newTurn (cell_t *Cells) {
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
	    return 0;
    
    memcpy(Cells, CellsCopy, WINDOW_SIZE * WINDOW_SIZE);
    return 1;
}

static void setPixel(int X, int Y, Color Color) {
    SDL_SetRenderDrawColor(Win.Renderer, Color.R, Color.G, Color.B, Color.A);
    SDL_RenderDrawPoint(Win.Renderer, X, Y);
}

static void drawGameSpace (const cell_t *Cells) {
    Color cellColor = {255, 0, 0, 255};

    for (int I = 0; I < WINDOW_SIZE; I++)
        for (int J = 0; J < WINDOW_SIZE; J++)
            if (Cells[I * WINDOW_SIZE + J] == 1)
                setPixel(I, J, cellColor);
}

bool isOpenWindow(cell_t *Cells) {
    SDL_Event Event;
    if (SDL_PollEvent(&Event) && Event.type == SDL_WINDOWEVENT && Event.window.event == SDL_WINDOWEVENT_CLOSE)
        return 0;
    SDL_SetRenderDrawColor(Win.Renderer, 0, 0, 0, 255);
    SDL_RenderClear(Win.Renderer);
    if (newTurn(Cells) == 0)
        return 0;
    drawGameSpace(Cells);
    SDL_RenderPresent(Win.Renderer);
    return 1;
}