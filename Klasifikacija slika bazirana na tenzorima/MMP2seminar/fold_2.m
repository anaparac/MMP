function [ A ] = fold_2( A_2, l, m, n)
    sizeA_2 = size(A_2);
    m_1 = sizeA_2(1);
    l_1 = sizeA_2(2);
    if ( (l_1 == l*n) & (m_1 == m))   
       

            for j = 1 : n
                    A(:,:,j) = A_2(:, 1 + (j-1)*l : j * l )';
            end    
    else
        A = [];
        disp('Krive dimenzije');
    end

end

