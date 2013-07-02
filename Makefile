#CC=g++ -03
CC=g++ 
CFLAGS=-g -Wall
CPPFLAGS=-I include

all: build neat

## Compile with -pg option to profile with gprof
debug: build/neat.o build/network.o build/nnode.o build/link.o build/trait.o build/gene.o build/genome.o build/innovation.o build/organism.o build/species.o build/population.o build/experiments.o build/neatmain.o
	$(CC) $(CFLAGS) $(CPPFLAGS) -pg $^ -o neat ## removed -c 
####

neat: build/neat.o build/network.o build/nnode.o build/link.o build/trait.o build/gene.o build/genome.o build/innovation.o build/organism.o build/species.o build/population.o build/experiments.o build/neatmain.o
	
	$(CC) $(CFLAGS) $(CPPFLAGS) $^ -o $@ ## removed -c 

build/neat.o: src/neat.cpp include/neat.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build/network.o: src/network.cpp include/network.h include/neat.h build/neat.o
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build/nnode.o: src/nnode.cpp include/nnode.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build/link.o: src/link.cpp include/link.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build/trait.o: src/trait.cpp include/trait.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build/gene.o: src/gene.cpp include/gene.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build/genome.o: src/genome.cpp include/genome.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build/innovation.o: src/innovation.cpp include/innovation.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build/organism.o: src/organism.cpp include/organism.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build/species.o: src/species.cpp include/species.h include/organism.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build/population.o: src/population.cpp include/population.h include/organism.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build/experiments.o: src/experiments.cpp include/experiments.h include/network.h include/species.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build/neatmain.o: src/neatmain.cpp include/neatmain.h include/neat.h include/population.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

build:
	mkdir build

clean:
	rm -rf build/ *~

purge:
	@echo Deleting *.o, *~, ./build and ./neat
	rm -rf build *~ neat




