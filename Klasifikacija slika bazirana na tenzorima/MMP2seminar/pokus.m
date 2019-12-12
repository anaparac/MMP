function [ norme ] = pokus()
    A = [1,4,7,10;2,5,8,11;3,6,9,12];
    for i = 1:100
        A(1,:) = i;
        T(:,:,i) = A;    
    end
    [S,U1,U2,U3] = svd_(T);
    norme = ones(1,3);
    for i = 1 : 3
        norme(1,i) = norm(squeeze(S(:,i,:)),'fro');
    end    
end
