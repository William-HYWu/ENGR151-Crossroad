# ENGR151 Project1

## Description

Project1 course outcome for ENGR151 in UM-SJTU JI. Incoming students of JI should not refer to this repo when completing the project. Any misconduct detected will be considered as violation to honor code, and will receive heavy punishment. The owner of this repo will not be held responsible for other people's mistake
## Contributor
Name: Haoyang Wu
Email: william-wu@sjtu.edu.cn

## Usage
This project simulates the traffic situation of a crossroad.

## Input
1. The total number of cars crossing the crossroad, and the program will randomly assign the number of cars on each side.
2. The width of the road
3. The probability of a car not stopping at a red light
4. Lasting time for green lights
5. Lasting time for yellow lights
6. Lasting time for red lights
7. Speed for the cars in four directions

## Compiling and running
OK.
 
## Brief documentation
1. The number of cars on each road isn't exactly random because the randi function itself is a pseudorandom.
2. The light1 is the two lights on the left lower and right upper corners that control the cars from the left and right
3. The light2 is the two lights on the left upper and right lower corners that control the cars from the up and below
4. Referred to the codes provided in the "Plot Circle" part of the "Plot function" when writing the function: "trafficlightinit"
5. The initial traffic light color should be green for the cars moving from left and right, and red for the cars moving from up and down.
6. The cars move one unit per second, and the width of the road is measured by units(e.g. if the road is 4 units wide, it means it takes the car 4 seconds to cross the road).
7. The cars are set to take up half of a lane, changing the width of the road won't change this.
8. The cars are set to be one unit long, changing the width of the road might change the shape of the cars.
9. For now, the program uses the flag variable to execute and quit the loop, thus the program will run for 40 seconds, but in a later version flag will be deleted and the criteria to exit the loop will be changed to cars crash.
10. Each car that arrives at the starting line when the light is red has to decide if it should stop at the red.
11.  The permutation is not fully random, it can only generate a certain subset with n(number of cars) output elements of the permutation of the randomly selected input elements.
12. The speed of the cars has only three levels, entering number beside 1,2,3 would not be valid and the program will ask you to enter the speed again
13. The cars move ten times per second in order to make the animation look more consistent and be better at detecting car crashes.
14. The function generateperm is the function I initially used to generate car plates, but it is not random enough as it can only generate multiple permutations of a given set of elements(e.g. the last five digits will be like ABC12 ABC21 AB1C2...). So I changed the algorithm and wrote the generatecarplates function. However, I still uploaded the original function with the project because I think it is a very powerful function that can generate the permutations of a certain set of elements as much as you want with one function.