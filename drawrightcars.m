function[store2,x,last2,polyvec2,index_notstop_right] = drawrightcars(right,x,y,light1,store2,w,p,polyvec2,speed_right)
    i = 1;
    last2 = 0;

    if right ~= 0 %If there are cars

        while x(i) < w/2 %Identify which is the last car that haven't finished crossing here
            i = i+1;
            last2 = last2+1;
            if i > right
                break
            else
                continue
            end
        end

        index_notstop_right = 0; % Assume first no car has not stopped at red light

        if light1 == 'g' %If the light is green
            [x,store2,polyvec2] = goahead(x,y,w,right,store2,polyvec2,speed_right); %Every car go ahead

        elseif light1 == 'y' %If the light is yellow

            if last2+1 >right
                last2 = right-1; %Prevent the index to exceed the array element
            end

            if x(last2+1) ~= w/2 %If cars at the crossroad aren't at the starting line
                [x,store2,polyvec2] = goahead(x,y,w,right,store2,polyvec2,speed_right); %All cars go ahead
            else %All cars at the crossroad are at the starting line
                [x,store2,polyvec2] = letfrontpass(x,y,w,last2,store2,polyvec2,speed_right); %Cars that have crossed go
            end

        elseif light1 == 'r' %If the light is red
        
            if last2+1 > right
                last2 = right-1; %Prevent the index to exceed the array element
            else
            end

            if x(last2+1) ~= w/2 %If some car did not stop at the red light last second
                [x,store2,polyvec2] = goahead(x,y,w,right,store2,polyvec2,speed_right); %All cars goahead

            else
                t = rand; %Generate a random number
                if t < 1-nthroot(1-p,10) %Judge if the car is not going to stop
                    [x,store2,polyvec2] = goahead(x,y,w,right,store2,polyvec2,speed_right); %All cars goahead
                    index_notstop_right = last2+1; %Record the number of the car that doesn't stop

                else %Every car is going to stop
                    [x,store2,polyvec2] = letfrontpass(x,y,w,last2,store2,polyvec2,speed_right); %Cars that have crossed go
                end
            end
        end

    else
        index_notstop_right = 0; %No car has not stopped at red light    
    end
end

function[x,store2,polyvec2] = goahead(x,y,w,right,store2,polyvec2,speed_right) %The function that move every car forward 1 unit
    x = round(x-speed_right/10,1); %Decide position
    delete(store2) %Delete previous drawings
    for j = 1:right
        store2(j) = rectangle('Position',[x(j),y,1,w/4],'FaceColor','y'); %Plot again
        polyvec2(j) = polyshape([x(j),x(j)+1,x(j)+1,x(j)],[y,y,y+w/4,y+w/4]); %Store it into poly shape so that it can be decided in overlaps
        hold on;
    end
end

function[x,store2,polyvec2] = letfrontpass(x,y,w,last2,store2,polyvec2,speed_right) %The function that move the cars that have crossed forward 1 unit
    delete(store2(1:last2)) %Delete previous drawings
    for j = 1:last2
        x(j) = round(x(j)-speed_right/10,1); %Decide position
        store2(j) = rectangle('Position',[x(j),y,1,w/4],'FaceColor','y'); %Plot again
        polyvec2(j) = polyshape([x(j),x(j)+1,x(j)+1,x(j)],[y,y,y+w/4,y+w/4]); %Store it into poly shape so that it can be decided in overlaps
        hold on;
    end
end