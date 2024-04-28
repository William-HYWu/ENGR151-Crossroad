function[x1,y1,x2,y2,x3,y3,x4,y4]=trafficlightinit(w)
%This function draw the four circles that represent the traffic lights

    r1 = w/8;

    xc1 = w/2;
    yc1 = w/2;

    theta = linspace(0,2*pi);
    x1 = r1*cos(theta) + xc1;
    y1 = r1*sin(theta) + yc1;
    plot(x1,y1,'k')
    fill(x1,y1,'g')
    axis equal

    hold on

    xc2 = -w/2;
    yc2 = -w/2;

    theta = linspace(0,2*pi);
    x2 = r1*cos(theta) + xc2;
    y2 = r1*sin(theta) + yc2;
    plot(x2,y2,'k')
    fill(x2,y2,'g')
    axis equal

    hold on

    xc3 = w/2;
    yc3 = -w/2;

    theta = linspace(0,2*pi);
    x3 = r1*cos(theta) + xc3;
    y3 = r1*sin(theta) + yc3;
    plot(x3,y3,'k')
    fill(x3,y3,'r')
    axis equal

    hold on

    xc4 = -w/2;
    yc4 = w/2;

    theta = linspace(0,2*pi);
    x4 = r1*cos(theta) + xc4;
    y4 = r1*sin(theta) + yc4;
    plot(x4,y4,'k')
    fill(x4,y4,'r')
    axis equal

    hold on
end