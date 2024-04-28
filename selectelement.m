function[finalset,set1,set2] = selectelement(set1,set2)
    finalset = string(1:5); %The set that contains the elements that form the last five digits of the car plates
    selectnumel_set1 = randi([1,4],1,1); %The number of elements that are selected from the number set

    for i = 1:selectnumel_set1
        finalset(i) = set1(randi([1,numel(set1)],1,1)); %The first "selectnumel_set1" number of elements are numbers
        set1 = set1(set1 ~= finalset(i)); %Prevent repetition
    end

    for j = selectnumel_set1+1:5
        finalset(j) = set2(randi([1,numel(set2)],1,1)); %The rest of the elements are characters
        set2 = set2(set2 ~= finalset(j)); %Prevent repetition
    end
end
