function store = generateperm(n,set,store,m)


%!!!Notice: This function isn't used in this project, but I keep it here as
% I think it is too cool to be deleted :-)it could create many permutations 
% of a set of elements at once and it took me a lot of time to write(the 
% user can decide how many permutation this function can generate)



%This is the function that generate random permutation
%Set contains all the elements required to generate the permutation
%Store is what stores the generated strings
%m is the number of permutation desired

    if n == 1 %If only one element in set
    store(1) = set;
    else
        [store] = generateperm(n-1,set(2:end),store,m); %Recursion
        x = store; %Save the store of the last recursive result so that it won't be altered by later operations
        store = string(zeros(n,factorial(n-1))); %Generate a new store to store newly generated permutations
        flag = 0; %Create a flag to count the number of generated permutations
        for i = 1:factorial(n-1)
            if flag< m %If flag haven't reach m (number of permutations have not reached the desired number)
                for j = 1:n
                    if flag < m
                        store(j,i) = insertAfter(x(i),j-1,set(1)); %Insert a new element in the generated permutations
                    flag = flag+1;
                    else
                        break;
                    end
                end
            else
                break
            end
        end
    end
end