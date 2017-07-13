# Reblur Image with Genetic Algorithm

The main purpose of this program is to create new blur image from a blurred image, it generated with genetic algorithm. This program contain:

+ reBluring: This is the main script, run this script on matlab to execute the program.
+ fitFunc: The fitness function formula, to keep the algorithm on track.
+ parSelect: Select the best parents with roulette method based on fitness Function.
+ doCrossover: Create random method with high stochastic, in this project i've used [one point crossover](https://www.tutorialspoint.com/genetic_algorithms/genetic_algorithms_crossover.htm).
+ doMutation: Create random method with low stochastic, in this project i've used combination of [bit flip and random resetting](https://www.tutorialspoint.com/genetic_algorithms/genetic_algorithms_mutation.htm).

The sample result of this project was saved in `/img` directory.
