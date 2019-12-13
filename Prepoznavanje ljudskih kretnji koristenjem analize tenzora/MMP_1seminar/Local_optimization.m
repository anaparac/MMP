%------------------------------------------------------------------------
% Local optimization 
%------------------------------------------------------------------------

Y_cell = cell(1,numVideo);
iter = 15;

for k = 1:iter
    display(k);
    Phi1 = zeros();
    Phi2 = zeros();
    Phi3 = zeros();
    
    kron1 = kron(U_2,U_3);
    kron2 = kron(U_3,U_1);
    kron3 = kron(U_1,U_2);
    
    for i = 1: numVideo
        pom = unfold(Actions{i},1) - unfold(AverageTensor,1);
        Phi1 = Phi1 + pom*kron1'*kron1*pom';
        pom = unfold(Actions{i},2) - unfold(AverageTensor,2);
        Phi2 = Phi2 + pom*kron2'*kron2*pom';
        pom = unfold(Actions{i},3) - unfold(AverageTensor,3);
        Phi3 = Phi3 + pom*kron3'*kron3*pom';      
    end
    
    [V,~] = eig(Phi1);
    U_1 = V(:,1:fix(size(V,2)/3)+7)';

    [V,~] = eig(Phi2);
    U_2 = V(:,1:fix(size(V,2)/3)+10)';

    [V,~] = eig(Phi3);
    U_3 = V(:,1:fix(size(V,2)/3))';

end