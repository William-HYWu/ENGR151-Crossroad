function[store3,y,last3,polyvec3,index_notstop_up] = drawupcars(up,x,y,light2,store3,w,p,polyvec3,speed_up)
    i = 1;
    last3 = 0;

    if up ~= 0 %If there are cars

        while y(i) < w/2 %Identify which is the last car that haven't finished crossing here
            i = i+1;
            last3 = last3+1;
            if i > up
            break
        else
            continue
        end
    end

        index_notstop_up = 0;%No car has not stopped at red light 

        if light2 == 'g' %If the light is green
            [y,store3,polyvec3] = goahead(x,y,w,up,store3,polyvec3,speed_up); %Every car go ahead

        elseif light2 == 'y' %If the light is yellow

            if last3+1 > up
                last3 = up-1; %Prevent the index to exceed the array element
            end

            if y(last3+1) ~= w/2 %If the cars at the crossroad aren't at the starting line
                [y,store3,polyvec3] = goahead(x,y,w,up,store3,polyvec3,speed_up); %All cars go ahead
            else %Cars are at the starting line
                [y,store3,polyvec3] = letfrontpass(x,y,w,last3,store3,polyvec3,speed_up); %Cars that have crossed go
            end

        elseif light2 == 'r' %If the light is red
        
            if last3+1 > up
                last3 = up-1; %Prevent the index to exceed the array element
            end
      
            if y(last3+1) ~= w/2 %If some car did not stop at the red light last second
                [y,store3,polyvec3] = goahead(x,y,w,up,store3,polyvec3,speed_up);

            else
                t = rand; %Generate a random number
                if t < 1-nthroot(1-p,10) %Judge if the car is not going to stop
                    [y,store3,polyvec3] = goahead(x,y,w,up,store3,polyvec3,speed_up); %If the car
                    % not going to stop, all cars move to front 1 unit
                    index_notstop_up = last3+1; %Record the number of the car that doesn't stop

                else %Every car is going to stop
                    [y,store3,polyvec3] = letfrontpass(x,y,w,last3,store3,polyvec3,speed_up);%Cars that have crossed go
                end
            end
        end

    else
        index_notstop_up = 0;%No car has not stopped at red light   
    end
end

function[y,store3,polyvec3] = goahead(x,y,w,up,store3,polyvec3,speed_up) %The function that move every car forward 1 unit
    y = round(y-speed_up/10,1); %Decide the postion
    delete(store3) %Delete the previous drawings
    for j = 1:up 
        store3(j) = rectangle('Position',[x,y(j),w/4,1],'FaceColor','c'); %Plot again
        polyvec3(j) = polyshape([x,x+w/4,x+w/4,x],[y(j),y(j),y(j)+1,y(j)+1]); %Store it into poly shape so that it can be decided in overlaps
        hold on;
    end
end

function[y,store3,polyvec3] = letfrontpass(x,y,w,last3,store3,polyvec3,speed_up) %The function that move the cars that have crossed forward 1 unit
    delete(store3(1:last3)) %Delete the previous drawings
    for j = 1:last3
        y(j) = round(y(j)-speed_up/10,1); %Decide the postion
        store3(j) = rectangle('Position',[x,y(j),w/4,1],'FaceColor','c'); %Plot again
        polyvec3(j) = polyshape([x,x+w/4,x+w/4,x],[y(j),y(j),y(j)+1,y(j)+1]); %Store it into poly shape so that it can be decided in overlaps
        hold on;
    end
end