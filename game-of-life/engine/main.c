#include "errors.h"
#include "engine.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include <SFML/Graphics.h>

static void setPixel (sfRenderWindow *Window, int X, int Y, sfColor Color) {
    sfVector2f Pos = {X, Y};
    sfVector2f Size = {1.0, 1.0};

    sfRectangleShape* Pix = sfRectangleShape_create ();
    sfRectangleShape_setPosition (Pix, Pos);
    sfRectangleShape_setFillColor (Pix, Color);
    sfRectangleShape_setSize (Pix, Size);

    sfRenderWindow_drawRectangleShape (Window, Pix, NULL);

    sfRectangleShape_destroy(Pix);
}


static sfRenderWindow* initWindow(const unsigned long long Size, const char *Name) {
    assert(Name);
    sfVideoMode VideoMode = { Size, Size, 32 };

    sfRenderWindow *Window = sfRenderWindow_create(VideoMode, Name, sfClose, NULL);
    if (!Window)
        exit(1);
}

static void drawGameSpace (sfRenderWindow *Window, const GameSpace *Space) {
    sfColor cellColor = sfRed;
    unsigned long long Size = Space->Size;

    for (int I = 0; I < Size; I++)
        for (int J = 0; J < Size; J++)
            if (Space->Cells[I * Size + J] == 1)
                addPixel (Window, I, J, cellColor);
}

int main (int argc, char **argv) {
    const size_t WindowSize = 800;

    sfRenderWindow *Window = initWindow (WindowSize, "Game of Life"); 

    GameSpace Space;
    int err = initGameSpace(&Space, WindowSize, 1); 
    if (err)
        exit(1);

    while (sfRenderWindow_isOpen(Window))
    {
        sfEvent event;
        while (sfRenderWindow_pollEvent(Window, &event))
            if (event.type == sfEvtClosed)
                sfRenderWindow_close(Window);

        sfRenderWindow_clear (Window, sfBlack);

        if (newTurn(&Space) == 0) {
            sfRenderWindow_close(Window);
        }

        drawGameSpace (Window, &Space);
        sfRenderWindow_display (Window);
    }

    destroyGameSpace (&Space);
    sfRenderWindow_destroy (Window);

    return 0;
}