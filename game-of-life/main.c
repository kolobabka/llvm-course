#include "engine/engine.h"
    
SDLWindow Win;

int main () {
    cell_t Cells[WINDOW_SIZE * WINDOW_SIZE];
    initGameSpace(Cells); 

    if (initWindow(WINDOW_SIZE, "Game of Life"))
        return -1; 

    isOpenWindow(Cells);

    destroyWindow();
    return 0;
}
