function[store3,y,polyvec3] = initupcars(up,x,y,w)
%This function would draw the cars in their initial postion and store them
%and initialize a polyshape vecter
    store3 = 1:up;

    %Draw cars in initial position
    for j = 1:up
        store3(j) = rectangle('Position',[x,y(j),w/4,1],'FaceColor','c');
        hold on;
    end

    %Initialize a polyshape vector
    polyvec3 = polyshape([-3*w/8,-w/8,-w/8,-3*w/8],[w/2,w/2,w/2+1,w/2+1]);
    for i = 2:up
        p1 = polyshape([-3*w/8,-w/8,-w/8,-3*w/8],[w/2+i,w/2+i,w/2+1+i,w/2+1+i]);
        polyvec3 = [polyvec3,p1];
    end