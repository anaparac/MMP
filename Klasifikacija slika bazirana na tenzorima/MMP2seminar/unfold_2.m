function [ A_2 ] = unfold_2( A )
    A_size = size(A);
    A_2 = [];
    k = A_size(3);
    for j = 1 : k
            A_2 = [A_2 A(:,:,j)'];

    end    
end

