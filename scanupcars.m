function[lastcross3] = scanupcars(y,up,w)
%This function can determine which is the last car that have finishe crossing the road in this lane

    if up ~= 0
        i = 1;
        lastcross3 = 0;
        while y(i)+1 <= -w/2 %Identify which is the last car that haven't finished crossing here
            i = i+1;
            lastcross3 = lastcross3+1;
            if i > up
                break
            else
                continue
            end
        end
    else
        lastcross3 = 0;
    end
end