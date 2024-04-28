function[up,down,left,right] = generatecarnumber(n)

    up = randi([0,n],1,1);
    down = randi([0,n-up],1,1);
    left = randi([0,n-up-down],1,1);
    right = n-up-down-left;