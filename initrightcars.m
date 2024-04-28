function[store2,xc2,polyvec2] = initrightcars(right,xc2,yc2,w)
%This function would draw the cars in their initial postion and store them
%and initialize a polyshape vecter
    store2 = 1:right;

    %Draw cars in initial position
    for i = 1:right
        store2(i) = rectangle('Position',[xc2(i),yc2,1,w/4],'FaceColor','y');
        hold on
    end

    %Initialize a polyshape vector
    polyvec2 = polyshape([w/2 w/2+1 w/2+1 w/2],[w/8,w/8,3*w/8,3*w/8]);
    p1 = polyshape([w/2 w/2+1 w/2+1 w/2],[w/8,w/8,3*w/8,3*w/8]);
    for i = 2:right
        polyvec2 = [polyvec2,p1];
    end
end