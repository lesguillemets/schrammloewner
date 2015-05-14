all: ./build/LoopErased.js ./build/RandomWalk.js ./build/HexaRandom.js

./build/LoopErased.js: ./src/LoopErased.hs
	hastec -Wall -fno-warn-unused-do-bind -O2 ./src/LoopErased.hs -isrc -o ./build/LoopErased.js

./build/RandomWalk.js: ./src/RandomWalk.hs
	hastec -Wall -fno-warn-unused-do-bind -O2 ./src/RandomWalk.hs -isrc -o ./build/RandomWalk.js

./build/HexaRandom.js: ./src/HexaRandom.hs
	hastec -Wall -fno-warn-unused-do-bind -O2 ./src/HexaRandom.hs -isrc -o ./build/HexaRandom.js

clean:
	rm ./build/*.js ./src/*.o ./src/*.hi
