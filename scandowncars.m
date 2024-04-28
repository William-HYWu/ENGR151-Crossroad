function[lastcross4] = scandowncars(y,down,w)
%This function can determine which is the last car that have finishe crossing the road in this lane

    if down ~= 0
        i = 1;
        lastcross4 = 0;
        while y(i) >= w/2 %Identify which is the last car that haven't finished crossing here
            i = i+1;
            lastcross4 = lastcross4+1;
            if i > down
                break
            else
                continue
            end
        end
    else
        lastcross4 = 0;
    end
end