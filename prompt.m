function[n,w,p,g,o,r,speed_left,speed_right,speed_up,speed_down] = prompt()
    n = input("Please enter the total number of cars:");
    w = input("Please enter the width of the road:");
    p = input("Please enter the probability that a car does not stop:");
    g = input("Please enter the lasting time for green lights:");
    o = input("Please enter the lasting time for orange lights:");
    r = input("Please enter the lasting time for red lights:");
    fprintf('\nThe range of the speed should be in the range of 1 to 3\n')
    fprintf(['\n 1 for moving 1 unit per second\n 2 for moving 2 units per second\n' ...
        ' 3 for moving 5 units per second\n'])
    speed_left = input('Please enter the speed of the cars from the left:');
    speed_right = input('Please enter the speed of the cars from the right:');
    speed_up = input('Please enter the speed of the cars from the up:');
    speed_down = input('Please enter the speed of the cars from the down:');

    while speed_left < 1 || speed_left > 3 || speed_right < 1 || speed_right > 3 ...
        || speed_up < 1 || speed_up > 3 || speed_down < 1 ||speed_down > 3 %Make sure the user enters the speed level right

        disp('Please enter again:')
        fprintf(['\n 1 for moving 1 unit per second\n 2 for moving 2 units per second\n' ...
        '3 for moving 5 units per second\n'])
        speed_left = input('Please enter the speed of the cars from the left:');
        speed_right = input('Please enter the speed of the cars from the right:');
        speed_up = input('Please enter the speed of the cars from the up:');
        speed_down = input('Please enter the speed of the cars from the down:');
    end

    if speed_left == 3
        speed_left = 5;
    end

    if speed_right == 3
        speed_right = 5;
    end

    if speed_up == 3
        speed_up = 5;
    end

    if speed_down == 3
        speed_down = 5;
    end
end