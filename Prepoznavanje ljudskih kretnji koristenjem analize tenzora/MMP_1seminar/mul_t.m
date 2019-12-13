function [ X ] = mul_t( T, A, t)
    
    T_size = size(T);
    A_size = size(A);
    X = [];
    switch t
    case 1
        X = fold_1(A*unfold_1(T), A_size(1), T_size(2), T_size(3));
    case 2
        X = fold_2(A*unfold_2(T), T_size(1), A_size(1), T_size(3));
    case 3
        X = fold_3(A*unfold_3(T), T_size(1), T_size(2), A_size(1));
    otherwise
        disp('Wrong mod')
    end
      
end
