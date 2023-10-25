#include "engine.h"
    
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include <SDL2/SDL.h>

typedef struct SDLWindow {
    unsigned long long Size;
    SDL_Window *Window;
    SDL_Renderer *Renderer;
} SDLWindow;

typedef struct Color {
    unsigned char R;
    unsigned char G;
    unsigned char B;
    unsigned char A;
} Color;

static SDLWindow Win;

static int initWindow(const unsigned long long Size, const char *Name) {
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

static bool isOpenWindow() {
    SDL_Event Event;
    while (SDL_PollEvent(&Event)) 
        if (Event.type == SDL_WINDOWEVENT && Event.window.event == SDL_WINDOWEVENT_CLOSE)
            return 0;
    return 1;
}

static void setPixel(int X, int Y, Color Color) {
    SDL_SetRenderDrawColor(Win.Renderer, Color.R, Color.G, Color.B, Color.A);
    SDL_RenderDrawPoint(Win.Renderer, X, Y);
}

static void destroyWindow() {
    SDL_DestroyRenderer(Win.Renderer);
    SDL_DestroyWindow(Win.Window);
    SDL_Quit();
}

static void drawGameSpace (const cell_t *Cells) {
    Color cellColor = {255, 0, 0, 255};

    for (int I = 0; I < WINDOW_SIZE; I++)
        for (int J = 0; J < WINDOW_SIZE; J++)
            if (Cells[I * WINDOW_SIZE + J] == 1)
                setPixel(I, J, cellColor);
}

int main (int argc, char **argv) {
    cell_t Cells[WINDOW_SIZE * WINDOW_SIZE];
    initGameSpace(Cells); 
    if (initWindow(WINDOW_SIZE, "Game of Life"))
        return -1; 

    while(isOpenWindow()) {
        SDL_SetRenderDrawColor(Win.Renderer, 0, 0, 0, 255);
        SDL_RenderClear(Win.Renderer);
        if (newTurn(Cells) == 0)
            break;
        drawGameSpace(Cells);
        SDL_RenderPresent(Win.Renderer);
    }

    destroyWindow();
    return 0;
}
