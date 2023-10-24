cmake_minimum_required(VERSION 3.1)

project(GameOfLife)

find_package(SDL2 REQUIRED)

message( STATUS "${SFML_INCLUDE_DIR}"  )

add_executable(GameOfLife main.c engine/engine.c)

target_include_directories(GameOfLife PUBLIC ${SDL2_INCLUDE_DIRS}  engine)
target_link_libraries(GameOfLife ${SDL2_LIBRARIES})

