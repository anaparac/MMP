function [ A ] = fold_1( A_1, l, m, n)
    sizeA_1 = size(A_1);
    l_1 = sizeA_1(1);
    m_1 = sizeA_1(2);
    if ( (l_1 == l) & (m_1 == m*n))   
       

            for j = 1 : n
                    A(:,:,j) = A_1(:, 1 + (j-1)*m : j * m );
            end    
    else
        A = [];
        disp('Krive dimenzije');
    end

end

