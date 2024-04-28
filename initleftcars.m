function[store1,x,polyvec1] = initleftcars(left,x,y,w)
%This function would draw the cars in their initial postion and store them
%and initialize a polyshape vecter
    store1 = 1:left;

%Draw cars in initial position
    for j = 1:left%plot n cars
        store1(j) = rectangle('Position',[x(j),y,1,w/4],'FaceColor','b');
        hold on;
    end

    %Initialize a polyshape vector
    polyvec1 = polyshape([-w/2-1 -w/2 -w/2 -w/2-1],[-3*w/8,-3*w/8,-w/8,-w/8]);
    p1 = polyshape([-w/2-1 -w/2 -w/2 -w/2-1],[-3*w/8,-3*w/8,-w/8,-w/8]);
    for i = 2:left
        polyvec1 = [polyvec1,p1];
    end
end