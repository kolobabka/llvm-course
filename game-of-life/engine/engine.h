#ifndef __ENGINE_H__
#define __ENGINE_H__

#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

#include <SDL2/SDL.h>

#include "errors.h"
#include "time.h"

typedef bool cell_t;

#define WINDOW_SIZE 800

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

int initWindow(const unsigned long long Size, const char *Name);
void destroyWindow();
void initGameSpace (cell_t *);
bool isOpenWindow(cell_t *Cells);

#endif