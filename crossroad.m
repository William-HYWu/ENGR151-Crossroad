function[] = crossroad(w)
%This function draw the solid line of the crossroad

    x1 = [w/2,4*w];
    y1 = [w/2,w/2];
    plot(x1,y1,'k','linewidth',2)
    hold on;

    x2 = [-w/2,-4*w];
    y2 = [w/2,w/2];
    plot(x2,y2,'k','linewidth',2)
    hold on;

    x3 = [w/2,w/2];
    y3 = [w/2,4*w];
    plot(x3,y3,'k','linewidth',2)
    hold on;

    x4 = [w/2,w/2];
    y4 = [-w/2,-4*w];
    plot(x4,y4,'k','linewidth',2)
    hold on;

    x5 = [w/2,4*w];
    y5 = [-w/2,-w/2];
    plot(x5,y5,'k','linewidth',2)
    hold on;


    x6 = [-w/2,-4*w];
    y6 = [-w/2,-w/2];
    plot(x6,y6,'k','linewidth',2)
    hold on;

    x7 = [-w/2,-w/2];
    y7 = [w/2,4*w];
    plot(x7,y7,'k','linewidth',2)
    hold on;

    x8 = [-w/2,-w/2];
    y8 = [-w/2,-4*w];
    plot(x8,y8,'k','linewidth',2)
    hold on;
end