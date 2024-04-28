%Prompt user input
[n,w,p,g,o,r] = prompt();

%Generating four numbers whose sum=n
[up,down,left,right] = generatecarnumber(n);

%Draw the traffic road
crossroad(w)
separateline(w)

%Initialize traffic light parameters
timel1green = 0; %Create timer for light1 green light
timel2green = 0; %Create timer for light2 green light
timel1orange = 0; %Create timer for light1 yellow light
timel2orange = 0; %Create timer for light2 yellow light
timel1red = 0; %Create timer for light1 red light
timel2red = 0; %Create timer for light2 red light
light1 = 'g'; %Initialize the color of light1 to be green
light2 = 'r'; %Initialize the color of light2 to be red
turngreen1 = 1; %Will be helpful to determine which car should move when light is orange
yc1 = -3*w/8; %The y coordinate of the cars from the left
yc2 = w/8; %The y coordinate of the cars from the right
%Should have xc3 xc4 in later version

[x1,y1,x2,y2,x3,y3,x4,y4] = trafficlightinit(w); %Initialize Trafficlight drawings

[xc1,xc2,yc3,yc4] = initialposition(w,left,right,up,down); %Initialize cars position

[store1,xc1] = initleftcars(left,xc1,yc1,w); %Draw the left cars in initial position
[store2,xc2] = initrightcars(right,xc2,yc2,w); %Draw the right cars in initial position

flag = 1; %Temporary

axis([-4*w 4*w -4*w 4*w]) %Fix the scope of the motion.

while flag ~= 40 %Temporary expression, will be changed to while "cars do not crash"
    [turngreen1,light1,timel1green,timel1orange,timel1red] = trafficl1(light1, ...
        timel1green,timel1orange,timel1red,g,o,r,x1,y1,x2,y2,turngreen1); %Control light1
    [light2,timel2green,timel2orange,timel2red] = trafficl2(light2, ...
        timel2green,timel2orange,timel2red,g,o,r,x3,y3,x4,y4); %Control light2

    [store1,xc1,last1] = drawleftcars(left,xc1,yc1,light1,store1,turngreen1,g,w); %Draw left cars
    [store2,xc2,last2] = drawrightcars(right,xc2,yc2,light1,store2,turngreen1,g,w); %Draw right cars

    [store1,xc1] = movetofront1(store1,xc1,yc1,last1,left,g,w,light1,timel1orange); 
    %Move left cars to the starting line
    [store2,xc2] = movetofront2(store2,xc2,yc2,last2,right,g,w,light1,timel1orange); 
    %Move right cars to the starting line

    pause(1)

    flag = flag+1; %Temporary statement, will be deleted in later versions

end