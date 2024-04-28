function[store4,y,last4,polyvec4,index_notstop_down] = drawdowncars(down,x,y,light2,store4,w,p,polyvec4,speed_down)
    i = 1;
    last4 = 0;

    if down ~= 0 %If there are cars

        while y(i)+1 > -w/2 %Identify which is the last car that haven't finished crossing here
            i = i+1;
            last4 = last4+1;
            if i > down
                break
            else
                continue
            end
        end

        index_notstop_down = 0; %Assume first no car has not stopped at red light

        if light2 == 'g' %If the light is green
            [y,store4,polyvec4] = goahead(x,y,w,down,store4,polyvec4,speed_down); %Every car go ahead

        elseif light2 == 'y' %If the light is yellow

            if last4+1 > down
                last4 = down-1; %Prevent the index to exceed the array element
            end

            if y(last4+1)+1 ~= -w/2 %If If cars at the crossroad aren't at the starting line
                [y,store4,polyvec4] = goahead(x,y,w,down,store4,polyvec4,speed_down); %All cars go ahead
            else %All cars at the crossroad are at the starting line
                [y,store4,polyvec4] = letfrontpass(x,y,w,last4,store4,polyvec4,speed_down); %Cars that have crossed go
            end

        elseif light2 == 'r' %If the light is red

            if last4+1 > down
                last4 = down-1; %Prevent the index to exceed the array element
            end

            if y(last4+1)+1 ~= -w/2 %If some car did not stop at the red light last second
                [y,store4,polyvec4] = goahead(x,y,w,down,store4,polyvec4,speed_down);
            else
                t = rand; %Generate a random number
                if t < 1-nthroot(1-p,10) %Judge if the car is not going to stop
                    [y,store4,polyvec4] = goahead(x,y,w,down,store4,polyvec4,speed_down);
                    index_notstop_down = last4+1; %Record the number of the car that doesn't stop

                else %Every car is going to stop
                    [y,store4,polyvec4] = letfrontpass(x,y,w,last4,store4,polyvec4,speed_down); %Cars that have crossed go
                    index_notstop_down = 0; %No car has not stopped at red light
                end
            end
        end

    else
        index_notstop_down = 0; %No car has not stopped at red light
    
    end
end

function[y,store4,polyvec4] = goahead(x,y,w,down,store4,polyvec4,speed_down) %The function that move every car forward 1 unit
    y = round(y+speed_down/10,1); %Decide position
    delete(store4) %Delete previous drawings
    for j = 1:down
        store4(j) = rectangle('Position',[x,y(j),w/4,1],'FaceColor','m'); %Plot again
        polyvec4(j) = polyshape([x,x+w/4,x+w/4,x],[y(j),y(j),y(j)+1,y(j)+1]); %Store it into poly shape so that it can be decided in overlaps
        hold on;
    end
end

function[y,store4,polyvec4] = letfrontpass(x,y,w,last4,store4,polyvec4,speed_down) %The function that move the cars that have crossed forward 1 unit
    delete(store4(1:last4)) %Delete previous drawings
    for j = 1:last4
        y(j) = round(y(j)+speed_down/10,1); %Decide position
        store4(j) = rectangle('Position',[x,y(j),w/4,1],'FaceColor','m'); %Plot again
        polyvec4(j) = polyshape([x,x+w/4,x+w/4,x],[y(j),y(j),y(j)+1,y(j)+1]); %Store it into poly shape so that it can be decided in overlaps
        hold on;
    end
end