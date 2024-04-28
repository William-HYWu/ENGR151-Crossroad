function[light1,timel1green,timel1orange,timel1red] = trafficl1(light1,timel1green,timel1orange,timel1red,g,o,r,x1,y1,x2,y2)

    if light1 == 'g' %When light1 is green

        if timel1green == g %Light1 should be changed
            fill(x1,y1,[1 0.5 0]) %Change light1
            fill(x2,y2,[1 0.5 0]) %Change light1
            light1 = 'y'; %Change light1 stage
            timel1green = 0; %Reset timer for green light1
            timel1orange = round(timel1orange+0.1,1); %Start the timer for yellow light

        else %Light1 should stay
            timel1green = round(timel1green+0.1,1); %Draw light1

        end

    elseif light1 == 'y' %When light1 is orange

        if timel1orange == o %Light1 should be changed
            fill(x1,y1,'r') %Change light1
            fill(x2,y2,'r') %Change light1
            light1 = 'r'; %Change light1
            timel1orange = 0; %Reset timer for orange light
            timel1red = round(timel1red+0.1,1); %Start the timer for red light
    
        else %Light1 should stay
            timel1orange = round(timel1orange+0.1,1); %Draw light1

        end

    elseif light1 == 'r' %When light1 is red

        if timel1red == r %Light1 should be changed
            fill(x1,y1,'g') %Change light1
            fill(x2,y2,'g') %Change light1
            light1 = 'g'; %Change light1
            timel1red = 0; %Reset timer for red light
            timel1green = round(timel1green+0.1,1); %Start the timer for green light

        else %Light1 should stay
            timel1red = round(timel1red+0.1,1); %Draw light1

        end

    end
end