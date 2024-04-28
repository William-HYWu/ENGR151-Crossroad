function[store1,x,last1,polyvec1,index_notstop_left] = drawleftcars(left,x,y,light1,store1,w,p,polyvec1,speed_left)
    i = 1;
    last1 = 0;

    if left ~= 0 %If there are cars

        while x(i)+1 > -w/2 %Identify which is the last car that haven't finished crossing here
            i = i+1;
            last1 = last1+1;
            if i > left
                break
            else
                continue
            end
        end

        index_notstop_left = 0; %Assume first no car has not stopped at red light

        if light1 == 'g' %If the light is green
            [x,store1,polyvec1] = goahead(x,y,w,left,store1,polyvec1,speed_left); %Every car go ahead

        elseif light1 == 'y' %If the light is yellow

            if last1+1 > left
                last1 = left-1; %Prevent the index to exceed the array element
            end

            if x(last1+1)+1 ~= -w/2 %If cars at the crossroad aren't at the starting line
                [x,store1,polyvec1] = goahead(x,y,w,left,store1,polyvec1,speed_left); %All cars go ahead
            else %All cars at the crossroad are at the starting line
                [x,store1,polyvec1] = letfrontpass(x,y,w,last1,store1,polyvec1,speed_left); %Cars that have crossed go
            end

        elseif light1 == 'r' %If the light is red

            if last1+1 > left
                last1 = left-1; %Prevent the index to exceed the array element
            end

            if x(last1+1)+1 ~= -w/2 %If some car did not stop at the red light last second
                [x,store1,polyvec1] = goahead(x,y,w,left,store1,polyvec1,speed_left);

            else
                t = rand; %Generate a random number
                if t < 1-nthroot(1-p,10) %Judge if the car is not going to stop
                    [x,store1,polyvec1] = goahead(x,y,w,left,store1,polyvec1,speed_left);
                    index_notstop_left = last1+1; %Record the number of the car that doesn't stop

                else %Every car is going to stop
                    [x,store1,polyvec1] = letfrontpass(x,y,w,last1,store1,polyvec1,speed_left); %Cars that have crossed go
                end
            end
        end

    else
        index_notstop_left = 0; %No car has not stopped at red light
    
    end
end

function[x,store1,polyvec1] = goahead(x,y,w,left,store1,polyvec1,speed_left) %The function that move every car forward 1 unit
    x = round(x+speed_left/10,1); %Decide position
    delete(store1) %Delete previous drawings
    for j = 1:left
        store1(j) = rectangle('Position',[x(j),y,1,w/4],'FaceColor','b'); %Plot again     
        polyvec1(j) = polyshape([x(j),x(j)+1,x(j)+1,x(j)],[y,y,y+w/4,y+w/4]); %Store it into poly shape so that it can be decided in overlaps
        hold on;
    end
end

function[x,store1,polyvec1] = letfrontpass(x,y,w,last1,store1,polyvec1,speed_left) %The function that move the cars that have crossed forward 1 unit
    delete(store1(1:last1)) %Delete previous drawings
    for j = 1:last1
        x(j) = round(x(j)+speed_left/10,1); %Decide position
        store1(j) = rectangle('Position',[x(j),y,1,w/4],'FaceColor','b'); %Plot again
        polyvec1(j) = polyshape([x(j),x(j)+1,x(j)+1,x(j)],[y,y,y+w/4,y+w/4]); %Store it into poly shape so that it can be decided in overlaps
        hold on;
    end
end