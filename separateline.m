function[] = separateline(w)
%This function draw the dashed line of the crossroad

    x9 = [0,0];
    y9 = [w/2,4*w];
    plot(x9,y9,'--','linewidth',2,'color',[0.7,0.7,0.7])
    hold on;

    x10 = [0,0];
    y10 = [-w/2,-4*w];
    plot(x10,y10,'--','linewidth',2,'color',[0.7,0.7,0.7])
    hold on;

    x11 = [w/2,4*w];
    y11 = [0,0];
    plot(x11,y11,'--','linewidth',2,'color',[0.7,0.7,0.7])
    hold on;

    x12 = [-w/2,-4*w];
    y12 = [0,0];
    plot(x12,y12,'--','linewidth',2,'color',[0.7,0.7,0.7])
    hold on;
end
