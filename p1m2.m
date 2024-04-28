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
yc1 = -3*w/8; %The y coordinate of the cars from the left
yc2 = w/8; %The y coordinate of the cars from the right
xc3 = -3*w/8; %The x coordinate of the cars from the up
xc4 = w/8; %The x coordinate of the cars from the down
set1 = ["1","2","3","4","5","6","7","8","9","0"];
set2 = ["A","B","C","D","E","F","G","H","I","J","K","L","M",...
    "N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

monitor = string(zeros(1,n)); %The monitor is a storage that can record the 

%Generate all the plates
[finalset,set1] = selectelement(set1,set2);
length = numel(finalset);
plates = string(zeros(length,factorial(length-1)));
plates = generateperm(length,finalset,plates,n); %Random permutation of the last 5 digits

for i=1:n
    first = set2(randi([1,26],1,1));
    plates(i) = insertAfter(plates(i),0,first); %The first digit of the plate should be a character
end

%Initialize Trafficlight drawings
[x1,y1,x2,y2,x3,y3,x4,y4] = trafficlightinit(w);

%Initialize cars position
[xc1,xc2,yc3,yc4] = initialposition(w,left,right,up,down);

[store1,xc1,polyvec1] = initleftcars(left,xc1,yc1,w); %Draw the left cars in initial position
[store2,xc2,polyvec2] = initrightcars(right,xc2,yc2,w); %Draw the right cars in initial position
[store3,yc3,polyvec3] = initupcars(up,xc3,yc3,w); %Draw the left cars in initial position
[store4,yc4,polyvec4] = initdowncars(down,xc4,yc4,w); %Draw the left cars in initial position

axis([-4*w 4*w -4*w 4*w]) %Fix the scope of the motion.

% Run the program for one time to initialize(mainly to decide if the while
% statement below is true)

[light1,timel1green,timel1orange,timel1red] = trafficl1(light1, ...
    timel1green,timel1orange,timel1red,g,o,r,x1,y1,x2,y2); %Control light1
[light2,timel2green,timel2orange,timel2red] = trafficl2(light2, ...
    timel2green,timel2orange,timel2red,g,o,r,x3,y3,x4,y4); %Control light2

%Draw left cars
[store1,xc1,last1,polyvec1] = drawleftcars(left,xc1,yc1,light1,store1,w,p,polyvec1);
%Draw right cars
[store2,xc2,last2,polyvec2] = drawrightcars(right,xc2,yc2,light1,store2,w,p,polyvec2); 
%Draw up cars
[store3,yc3,last3,polyvec3] = drawupcars(up,xc3,yc3,light2,store3,w,p,polyvec3);
%Draw down cars
[store4,yc4,last4,polyvec4] = drawdowncars(down,xc4,yc4,light2,store4,w,p,polyvec4);

pause(1)

polyvc=[polyvec1,polyvec2,polyvec3,polyvec4];%Put all four polyshape vector 
    % together to determine whether there is overlapping or not


while sum(sum(overlaps(polyvc))) == n+4-nnz([up down left right]) %If there's no overlapping(crashes)
    [light1,timel1green,timel1orange,timel1red] = trafficl1(light1, ...
        timel1green,timel1orange,timel1red,g,o,r,x1,y1,x2,y2); %Control light1
    [light2,timel2green,timel2orange,timel2red] = trafficl2(light2, ...
        timel2green,timel2orange,timel2red,g,o,r,x3,y3,x4,y4); %Control light2

    %Draw left cars
    [store1,xc1,last1,polyvec1,index_notstop_left] = drawleftcars(left,xc1,yc1,light1,store1,w,p,polyvec1); 
    %Draw right cars
    [store2,xc2,last2,polyvec2,index_notstop_right] = drawrightcars(right,xc2,yc2,light1,store2,w,p,polyvec2);
    %Draw up cars
    [store3,yc3,last3,polyvec3,index_notstop_up] = drawupcars(up,xc3,yc3,light2,store3,w,p,polyvec3);
    %Draw down cars
    [store4,yc4,last4,polyvec4,index_notstop_down] = drawdowncars(down,xc4,yc4,light2,store4,w,p,polyvec4);

    %Move left cars to the starting line when the light is yellow
    [store1,xc1] = yellowmovetofront1(store1,xc1,yc1,last1,left,w,light1,timel1orange); 
    %Move right cars to the starting line when the light is yellow
    [store2,xc2] = yellowmovetofront2(store2,xc2,yc2,last2,right,w,light1,timel1orange); 
    %Move up cars to the starting line when the light is yellow
    [store3,yc3] = yellowmovetofront3(store3,xc3,yc3,last3,up,w,light2,timel2orange);
    %Move down cars to the starting line when the light is yellow
    [store4,yc4] = yellowmovetofront4(store4,xc4,yc4,last4,down,w,light2,timel2orange);

    pause(1)

    polyvc=[polyvec1,polyvec2,polyvec3,polyvec4]; %Put all four polyshape vector 
    % together to determine whether there is overlapping or not

    if index_notstop_left ~= 0 %If there is a left car that did not stop at red
        monitor(index_notstop_left) = plates(index_notstop_left); %Record and store the plate
    end

    if index_notstop_right ~= 0 %If there is a right car that did not stop at red
        monitor(index_notstop_right+left) = plates(index_notstop_right+left); %Record and store the plate
    end
    
    if index_notstop_up ~= 0 %If there is an up car that did not stop at red
        monitor(index_notstop_up+left+right) = plates(index_notstop_up+left+right); %Record and store the plate
    end

    if index_notstop_down ~= 0 %If there is a down car that did not stop at red
        monitor(index_notstop_down+left+right+up) = plates(index_notstop_down+left+right+up); %Record and store the plate
    end

    if last1+1 >= left && last2 >= right && last3 >= up && last4 >= down %Judge if the player has won
        break
    end
end

if last1 == left && last2 == right && last3 == up && last4 == down %Judge if the player has won
    disp("Congrats, you won!")
else
    disp("You lost")
    disp('Some cars did not stop at red light')
end

disp(monitor(monitor~="0"))
