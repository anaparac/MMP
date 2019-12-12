function [ A_3 ] = unfold_3( A )
    A_size = size(A);
    A_3 = [];
    [a, i, b] = size(A);
    for j = 1 : i
            A_3 = [A_3 squeeze(A(:,j,:))'];
    end    
end

