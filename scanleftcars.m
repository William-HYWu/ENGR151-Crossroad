function[lastcross1] = scanleftcars(x,left,w)
%This function can determine which is the last car that have finishe crossing the road in this lane

    if left ~= 0
        i = 1;
        lastcross1 = 0;
        while x(i) >= w/2 %Identify which is the last car that haven't finished crossing here
            i = i+1;
            lastcross1 = lastcross1+1;
            if i > left
                break
            else
                continue
            end
        end
    else
        lastcross1 = 0;
    end
end