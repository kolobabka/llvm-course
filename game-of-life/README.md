# How to build

To build only the application 
```
clang -O2 engine/sim.c engine/app.c -lSDL2 -o GameOfLife
```

```
clang++ -O2 ./Pass.cpp -c -fPIC -I`llvm-config --includedir` -o Pass.o
clang++ Pass.o -fPIC -shared -o libPass.so
clang++ -O2 log.cpp -fPIC -c -o log.o
clang -Xclang -load -Xclang ./libPass.so engine/app.c engine/sim.c log.o -O2 -lSDL2 -lstdc++ -flegacy-pass-manager -o GameOfLife
```

you would get an executable 'GameOfLife' file

# Statistic 
```
alloca --- 2
or --- 800
mul --- 2400
ret --- 174672
lshr --- 524004
store --- 925526
select --- 1064376
call --- 1164024
and --- 1280000
trunc --- 1514141
zext --- 4471204
icmp --- 4906781
load --- 6739745
getelementptr --- 7030406
br --- 12751058
add --- 15052886
```
