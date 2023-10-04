cmake_minimum_required(VERSION 3.1)

project(GameOfLife)

## If you want to link SFML statically
# set(SFML_STATIC_LIBRARIES TRUE)

## In most cases better set in the CMake cache
# set(SFML_DIR "<sfml root prefix>/lib/cmake/SFML")

find_package(SFML COMPONENTS graphics audio REQUIRED)

message( STATUS "${SFML_INCLUDE_DIR}"  )

add_executable(GameOfLife main.c engine/engine.c)


target_include_directories(GameOfLife PUBLIC ${SFML_INCLUDE_DIR} engine)
target_link_libraries(GameOfLife csfml-graphics csfml-window csfml-system )

