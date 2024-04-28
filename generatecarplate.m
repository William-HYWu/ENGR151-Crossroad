function plate = generatecarplate(set,n)

    if n == 1
        plate = set; %Base case: If there is only one element in the input set
    else
        plate = generatecarplate(set(1:n-1),n-1); %Recursion: If more than one 
        %element in one set
        plate = insertAfter(plate,randi([0,n-1]),set(n)); %Insert the next element after 
        %the generated set.
    end
end