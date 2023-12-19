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
bitcast --- 2
alloca --- 3
or --- 800
mul --- 2400
ret --- 173902
lshr --- 521697
store --- 925046
select --- 1064218
call --- 1161719
and --- 1280000
trunc --- 1510296
zext --- 4471204
icmp --- 4906625
load --- 6738209
getelementptr --- 7030408
br --- 12750131
add --- 15053366
```
