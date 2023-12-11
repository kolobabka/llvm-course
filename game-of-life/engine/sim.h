#ifndef __SIM_H__
#define __SIM_H__

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>

// #include "errors.h"

typedef bool cell_t;

#define WINDOW_SIZE 800

struct SDL_Window;
struct SDL_Renderer;

typedef struct SDLWindow {
    unsigned long long Size;
    struct SDL_Window *Window;
    struct SDL_Renderer *Renderer;
} SDLWindow;

typedef struct Color {
    unsigned char R;
    unsigned char G;
    unsigned char B;
    unsigned char A;
} Color;

void setPixel(int X, int Y, Color Color);
int app(cell_t *Cells);

#endif //__SIM_H__