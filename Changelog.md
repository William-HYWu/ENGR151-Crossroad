# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),

## [2.0.4]-2023-10-13

### Added
- The function generatecarplate that can generate the permutation of a given set (making the set random would make the plates random)
### Fixed
- The plates of the cars aren't exactly random
## [2.0.3]-2023-10-11

## Fixed
- The cars' behavior is weird after adding frames (Basically because adding ten 0.1 together is not 1 in Matlab)

## Changed
- Included the yellowmovetofront function in the drawcars function.
- The car speed has only three levels now.
## [2.0.2]-2023-10-10

### Fixed
- The cars sometimes don't stop at the yellow light when the speed is altered
## [2.0.1]-2023-10-9

### Added
- Added more fames to the motion and make the animation more fluent (move per 0.1 second)
## [2.0.0]-2023-10-8

### Added
- Allow the users to adjust the car speed by adding user input prompts in the prompt function
- Added the variables (speed_left,speed_right,speed_up,speed_down)
## [1.0.4]-2023-10-6

### Added
- Added the selectelement and generateperm functions to generate car plates and allow the program to display the plates of the cars that didn't behave at red light
- Added the code to display the words representing the winning or losing of the player

### Changed
- Reorganized the drawcars function codes into the format of several subfunctions

## [1.0.3]-2023-10-5

### Added
- Added the polyvec variables and used the overlaps function to determine if there is a car crash
### Fixed
- Fixed the problem that cars from multiple directions can not broke traffic rules(not stopping at red light) at the same time

## [1.0.2]-2023-10-4

### Changed
- Deleted the redmovetofront functions and wrote the simplified version in to the drawcars functions

## [1.0.1]-2023-10-2

### Added
- Added the drawupcars and the drawdowncars function
- Added the redmovetofront2, redmovetofront3, redmovetofront4, yellowmovetofront3 and yellowmovetofront4 function
## [1.0.0] - 2023-10-1

### Added
- Added the codes that control the red light in the drawleftcars function
- Added the redmovetofront1 function to move the cars to the starting line when light is red

### Changed
- Changed the movetofront function names to yellowmovetofront to distinguish between redmovetofront

## [0.0.7] - 2023-09-28
### Changed
 - Organized the original input prompt into a prompt function
 - Organized the original generate car number codes into generatecarnumber function
 - Organized the code that controls light1 into the trafficl1 function

## [0.0.6] - 2023-09-28

### Added

- Created the drawrightcars function to animate the right cars
- The movetofront2 function to move the right cars to the front line when the light is yellow
- Included the initialization of the right cars in the initialposition function
- Created the initrightcars function to draw the initial right cars
### Fixed

- The last1 in the drawleftcars function can sometimes<0, resulting in the indices crash
- The cars that have already crossed the road don't move when the light is yellow

### Changed

- Change the movetofront function to movetofront1 to represent moving the left cars to the starting line when light is yellow
## [0.0.5] - 2023-09-27

### Added

- The movetofront function

### Fixed

- In some cases, the cars don't always start from the starting line.

### Changed

- Separated the part in the crossroad function that plots the lane line.

## [0.0.4] - 2023-09-26

### Added

- The part in the drawleftcars function to plot the cars if the light is orange

## [0.0.3] - 2023-09-25

### Added

- The drawleftcars function to draw the left cars if the light is green
- The initialposition function to initialize the position of the cars
- The initleftcars function to plot the initial left cars

## [0.0.2] - 2023-09-24

### Added

- The part in the p1m1 that generates four numbers of which the sum is n
- The part in the p1m1 that controls the changes of  l1

## [0.0.1] - 2023-09-23
### Added

- The input prompts
- The crossroad function to draw the crossroad
- The trafficlightinit function to initialize the traffic lights
- The trafficl2 function to control the changes of l2
