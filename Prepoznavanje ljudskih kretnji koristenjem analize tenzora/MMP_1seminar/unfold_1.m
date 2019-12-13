function [ A_1 ] = unfold_1( A )
    A_size = size(A);
    A_1 = [];
    m = A_size(2);
    k = A_size(3);
    for j = 1 : k
        for i = 1 : m
            A_1 = [A_1 A(:,i,j)];
        end
    end    
end

