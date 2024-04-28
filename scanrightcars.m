function[lastcross2] = scanrightcars(x,right,w)
%This function can determine which is the last car that have finishe crossing the road in this lane

    if right ~= 0
        i = 1;
        lastcross2 = 0;
        while x(i)+1 <= -w/2 %Identify which is the last car that haven't finished crossing here
            i = i+1;
            lastcross2 = lastcross2+1;
            if i > right
                break
            else
                continue
            end
        end
    else
        lastcross2 = 0;
    end
end