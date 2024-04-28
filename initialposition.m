function[xc1,xc2,yc3,yc4] = initialposition(w,left,right,up,down)
    xc1 = 1:left;
    xc2 = 1:right;
    yc3 = 1:up;
    yc4 = 1:down;

    for i = 1:left
        xc1(i) = -w/2-1-(i-1)*2;
    end

    for j = 1:right
        xc2(j) = w/2+(j-1)*2;
    end

    for t = 1:up
        yc3(t) = w/2+(t-1)*2;
    end

    for m = 1:down
        yc4(m) = -w/2-1-(m-1)*2;
    end