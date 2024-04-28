function[store4,y,polyvec4] = initdowncars(down,x,y,w)
%This function would draw the cars in their initial postion and store them
%and initialize a polyshape vecter
    store4 = 1:down;

    %Draw cars in initial position
    for j = 1:down 
        store4(j) = rectangle('Position',[x,y(j),w/4,1],'FaceColor','m');
        hold on;
    end

    %Initialize a polyshape vector
    polyvec4 = polyshape([w/8,3*w/8,3*w/8,w/8],[-w/2-1,-w/2-1,-w/2,-w/2]);
    for i = 2:down
        p1 = polyshape([w/8,3*w/8,3*w/8,w/8],[-w/2-1-i,-w/2-1-i,-w/2-i,-w/2-i]);
        polyvec4 = [polyvec4,p1];
    end
end