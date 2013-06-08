#CC=g++ -03
CC=g++ 
CFLAGS=-g -Wall
CPPFLAGS=-I include

all: neat 

## Compile with -pg option to profile with gprof
debug: neat.o network.o nnode.o link.o trait.o gene.o genome.o innovation.o organism.o species.o population.o experiments.o neatmain.o
	$(CC) $(CFLAGS) $(CPPFLAGS) -pg $^ -o neat ## removed -c 
####

neat: neat.o network.o nnode.o link.o trait.o gene.o genome.o innovation.o organism.o species.o population.o experiments.o neatmain.o
	$(CC) $(CFLAGS) $(CPPFLAGS) $^ -o $@ ## removed -c 

neat.o: src/neat.cpp include/neat.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

network.o: src/network.cpp include/network.h include/neat.h neat.o
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

nnode.o: src/nnode.cpp include/nnode.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

link.o: src/link.cpp include/link.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

trait.o: src/trait.cpp include/trait.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

gene.o: src/gene.cpp include/gene.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

genome.o: src/genome.cpp include/genome.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

innovation.o: src/innovation.cpp include/innovation.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

organism.o: src/organism.cpp include/organism.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

species.o: src/species.cpp include/species.h include/organism.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

population.o: src/population.cpp include/population.h include/organism.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

experiments.o: src/experiments.cpp include/experiments.h include/network.h include/species.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

neatmain.o: src/neatmain.cpp include/neatmain.h include/neat.h include/population.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

clean:
	rm *.o *~

purge:
	rm *.o *~ neat 


