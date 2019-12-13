function [ A ] = fold_3( A_3, l, m, n)
    sizeA_3 = size(A_3);
    m_1 = sizeA_3(1);
    l_1 = sizeA_3(2);
    if ( (l_1 == l*m) && (m_1 == n))   
       
            for i = 1 : n
                for j = 1 : l_1/l 
                    A(:,j,i) = A_3(i, 1 + (j-1)*l : j * l );
                end
            end    
    else
        A = [];
        disp('Krive dimenzije');
    end

end

