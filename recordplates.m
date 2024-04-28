function [monitor] = recordplates(index_notstop_left,index_notstop_right,index_notstop_up,index_notstop_down,monitor,left,right,up,plates)
%Record the plate of those that didn't stop at red light
    if index_notstop_left ~= 0 %If there is a left car that did not stop at red
        monitor(index_notstop_left) = plates(index_notstop_left); %Record and store the plate
    end

    if index_notstop_right ~= 0 %If there is a right car that did not stop at red
        monitor(index_notstop_right+left) = plates(index_notstop_right+left); %Record and store the plate
    end
    
    if index_notstop_up ~= 0 %If there is an up car that did not stop at red
        monitor(index_notstop_up+left+right) = plates(index_notstop_up+left+right); %Record and store the plate
    end

    if index_notstop_down ~= 0 %If there is a down car that did not stop at red
        monitor(index_notstop_down+left+right+up) = plates(index_notstop_down+left+right+up); %Record and store the plate
    end
end
