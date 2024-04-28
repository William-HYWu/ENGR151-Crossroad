function[light2,timel2green,timel2orange,timel2red] = trafficl2(light2,timel2green,timel2orange,timel2red,g,o,r,x3,y3,x4,y4)

    if light2 == 'g' %When light2 is green

        if timel2green == g %Light2 should be changed
            fill(x3,y3,[1 0.5 0]) %Change light2
            fill(x4,y4,[1 0.5 0]) %Change light2
            light2 = 'y'; %Change light2 stage
            timel2green = 0; %Reset timer for green light
            timel2orange = round(timel2orange+0.1,1); %Start the timer for orange light

        else %Light1 should stay
            timel2green = round(timel2green+0.1,1); %Draw light2

        end

    elseif light2 == 'y' %When light2 is orange

        if timel2orange == o %Light2 should be changed
            fill(x3,y3,'r') %Change light2
            fill(x4,y4,'r') %Change light2
            light2 = 'r'; %Change light2 stage
            timel2orange = 0; %Reset timer for orange light
            timel2red = round(timel2red+0.1,1); %Start the timer for red light

        else %Light2 should stay
            timel2orange = round(timel2orange+0.1,1); %Draw light2

        end

    elseif light2 == 'r' %When light2 is red

        if timel2red == r %Light2 should be changed       
            fill(x3,y3,'g') %Change light2
            fill(x4,y4,'g') %Change light2
            light2 = 'g'; %Change light2 stage
            timel2red = 0; %Reset timer for red light
            timel2green = round(timel2green+0.1,1);

        else %Light2 should stay
            timel2red = round(timel2red+0.1,1); %Draw light2

        end
    
    end
end