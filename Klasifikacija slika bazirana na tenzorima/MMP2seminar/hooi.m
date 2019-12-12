function [B, U1, U2, U3] = hooi(A,R,kmax)
    %A = tensor(A);
    N = ndims(A);
    % Default value
    if ~exist('kmax','var')
        kmax = 5;
    end
    
    % Compute an orthonormal basis for the dominant
    % Rn-dimensional left singular subspace of
    % A_(n) (1 <= n <= N). We store its transpose.
    for n = 1:N
        [U, S, V] = svds(double(unfold(A,n)), R(n));
        Ut{n} = U';
    end
    
    % Iterate until convergence
    for k = 1:kmax
        for n = 1:N
            niz = linspace(1,N,N);
            niz(n) = [];
            Utilde = ttm(A, Ut, niz);
            % Maximize norm(Utilde x_n W’) wrt W and
            % keeping orthonormality of W

            [W,S,V] = svds(unfold(Utilde, n), R(n));
            Ut{n} = W';
        end
    end
    
    
    % Create the core array
    niz = linspace(1,N,N);
    lambda = ttm(A, Ut, niz );

    % Create cell array containing U from the cell
    % array containing its transpose
    for n = 1:N
        U_1{n} = Ut{n}';
    end
    % Assemble the resulting tensor
    B = tucker_tensor(lambda, U_1);
end
