./build/LoopErased.js: ./src/LoopErased.hs
	hastec -Wall -fno-warn-unused-do-bind -O2 ./src/LoopErased.hs -isrc -o ./build/LoopErased.js

./build/RandomWalk.js: ./src/RandomWalk.hs
	hastec -Wall -fno-warn-unused-do-bind -O2 ./src/RandomWalk.hs -isrc -o ./build/RandomWalk.js

clean:
	rm ./build/*.js ./src/*.o ./src/*.hi
