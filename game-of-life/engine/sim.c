#include "sim.h"

#include <limits.h>
#include <stdio.h>
#include <time.h>

#include <SDL2/SDL.h>

static SDLWindow Win;

void destroyWindow() {
    SDL_DestroyRenderer(Win.Renderer);
    SDL_DestroyWindow(Win.Window);
    SDL_Quit();
}

void setPixel(int X, int Y, Color Color) {
    SDL_SetRenderDrawColor(Win.Renderer, Color.R, Color.G, Color.B, Color.A);
    SDL_RenderDrawPoint(Win.Renderer, X, Y);
}

bool isOpenWindow(cell_t *Cells) {
    SDL_Event Event;
    if (SDL_PollEvent(&Event) && Event.type == SDL_WINDOWEVENT && Event.window.event == SDL_WINDOWEVENT_CLOSE)
        return 0;
    SDL_SetRenderDrawColor(Win.Renderer, 0, 0, 0, 255);
    SDL_RenderClear(Win.Renderer);
    if (app(Cells) == 0)
        return 0;
    SDL_RenderPresent(Win.Renderer);
    return 1;
}
    
int simInit(const char *Name, cell_t *Cells) {
    if (!Name) {
        fprintf(stderr, "Need to specify name of window\n");
        return -1;
    }

    Win.Size = WINDOW_SIZE;
    Win.Window = SDL_CreateWindow(Name, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WINDOW_SIZE, WINDOW_SIZE, /* flags */ 0);
    if (!Win.Window) {
        fprintf(stderr, "Failed to create SDL window\n");    
        return -1;
    }

    Win.Renderer = SDL_CreateRenderer(Win.Window, /* index */ -1, /* flags */ 0);
    if (!Win.Renderer) {
        fprintf(stderr, "Failed to create SDL renderer\n");    
        return -1;
    }

    srand(time(NULL));

     for (int I = 0; I < WINDOW_SIZE; I++)
        for (int J = 0; J < WINDOW_SIZE; J++)
            Cells[I * WINDOW_SIZE + J] = rand() % 2;

    return 0;    
}

int main () {
    cell_t Cells[WINDOW_SIZE * WINDOW_SIZE];
    if (simInit("Game of Life", Cells))
        return -1;

    isOpenWindow(Cells);

    destroyWindow();
    return 0;
}