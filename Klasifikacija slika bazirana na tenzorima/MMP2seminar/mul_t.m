function [ X ] = mul_t( T, A, t)
    
    [T_size1,T_size2,T_size3 ] = size(T);
    A_size = size(A);
    X = [];
    switch t
    case 1
        X = fold_1(A*unfold(T,1), A_size(1), T_size2, T_size3);
    case 2
        X = fold_2(A*unfold(T,2), T_size1, A_size(1), T_size3);
    case 3
        X = fold_3(A*unfold(T,3), T_size1, T_size2, A_size(1));
    otherwise
        disp('Wrong mod')
    end
      
end
