%Prompt user input
[n,w,p,g,o,r,speed_left,speed_right,speed_up,speed_down] = prompt();

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

monitor = string(zeros(1,n)); %The monitor is a storage that can record the plates 

%Generate all the plates

plates = string(1:n);

for i=1:n
    [finalset] = selectelement(set1,set2); %Select a set of five elements containing numbers and characters
    plates(i) = generatecarplate(finalset,5); %Generate the permutation of the set
    first = set2(randi([1,26],1,1)); %Randomly a first character of the plate
    plates(i) = insertAfter(plates(i),0,first); %The first digit of the plate should be a character
    while sum(plates == plates(i)) ~= 1 %Prevent the twe plats being identical
        [finalset] = selectelement(set1,set2);
        plates(i) = generatecarplate(finalset,5);
        first = set2(randi([1,26],1,1));
        plates(i) = insertAfter(plates(i),0,first); %The first digit of the plate should be a character
    end
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
[store1,xc1,last1,polyvec1,index_notstop_left] = drawleftcars(left,xc1,yc1,light1,store1,w,p,polyvec1,speed_left);
%Draw right cars
[store2,xc2,last2,polyvec2,index_notstop_right] = drawrightcars(right,xc2,yc2,light1,store2,w,p,polyvec2,speed_right); 
%Draw up cars
[store3,yc3,last3,polyvec3,index_notstop_up] = drawupcars(up,xc3,yc3,light2,store3,w,p,polyvec3,speed_up);
%Draw down cars
[store4,yc4,last4,polyvec4,index_notstop_down] = drawdowncars(down,xc4,yc4,light2,store4,w,p,polyvec4,speed_down);

%Store the plates of the cars that didn't stop to the monitor
[monitor] = recordplates(index_notstop_left,index_notstop_right,index_notstop_up,index_notstop_down,monitor,left,right,up,plates);

pause(0.1)

polyvc=[polyvec1,polyvec2,polyvec3,polyvec4];%Put all four polyshape vector 
% together to determine whether there is overlapping or not

[lastcross1] = scanleftcars(xc1,left,w); %Decide how many cars from the left have finished crossing road
[lastcross2] = scanrightcars(xc2,right,w); %Decide how many cars from the right have finished crossing road
[lastcross3] = scanupcars(yc3,up,w); %Decide how many cars from the up have finished crossing road
[lastcross4] = scandowncars(yc4,down,w); %Decide how many cars from the down have finished crossing road


while sum(sum(overlaps(polyvc))) == n+4-nnz([up down left right]) %If there's no overlapping(crashes)
    [light1,timel1green,timel1orange,timel1red] = trafficl1(light1, ...
        timel1green,timel1orange,timel1red,g,o,r,x1,y1,x2,y2); %Control light1
    [light2,timel2green,timel2orange,timel2red] = trafficl2(light2, ...
        timel2green,timel2orange,timel2red,g,o,r,x3,y3,x4,y4); %Control light2

    %Control left cars
    [store1,xc1,last1,polyvec1,index_notstop_left] = drawleftcars(left,xc1,yc1,light1,store1,w,p,polyvec1,speed_left); 
    %Control right cars
    [store2,xc2,last2,polyvec2,index_notstop_right] = drawrightcars(right,xc2,yc2,light1,store2,w,p,polyvec2,speed_right);
    %Control up cars
    [store3,yc3,last3,polyvec3,index_notstop_up] = drawupcars(up,xc3,yc3,light2,store3,w,p,polyvec3,speed_up);
    %Control down cars
    [store4,yc4,last4,polyvec4,index_notstop_down] = drawdowncars(down,xc4,yc4,light2,store4,w,p,polyvec4,speed_down);

    pause(0.1)

    polyvc=[polyvec1,polyvec2,polyvec3,polyvec4]; %Put all four polyshape vector 
    % together to determine whether there is overlapping or not
   
    %Store the plates of the cars that didn't stop to the monitor
    [monitor] = recordplates(index_notstop_left,index_notstop_right,index_notstop_up,index_notstop_down,monitor,left,right,up,plates);
    
    %Decide how many cars have finished crossing road
    [lastcross1] = scanleftcars(xc1,left,w); %Decide how many cars from the left have finished crossing road
    [lastcross2] = scanrightcars(xc2,right,w); %Decide how many cars from the right have finished crossing road
    [lastcross3] = scanupcars(yc3,up,w); %Decide how many cars from the up have finished crossing road
    [lastcross4] = scandowncars(yc4,down,w); %Decide how many cars from the down have finished crossing road

    if lastcross1 >= left && lastcross2 >= right && lastcross3 >= up  && lastcross4 >= down  %Judge if the player has won
        break
    end
end

if lastcross1 >= left && lastcross2 >= right && lastcross3 >= up  && lastcross4 >= down %Judge if the player has won
    disp("Congrats, you won!")
else
    disp("You lost")
end

if isempty(monitor(monitor ~= "0")) %If the monitor didn't record anything
    disp('Everyone kept the rule')
else
    disp('Some cars did not stop at red light')
    disp(monitor(monitor ~= "0"))
end