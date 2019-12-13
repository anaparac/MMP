%------------------------------------------------------------------------
% Initialization
%------------------------------------------------------------------------
size_video = size(Actions{1}); 


Phi1 = zeros(size_video(1));
Phi2= zeros(size_video(2));
Phi3= zeros(size_video(3));

for j = 1: numVideo      
      Phi1 = Phi1 + unfold(Actions{j},1)*unfold(Actions{j},1)';
      Phi2 = Phi2 + unfold(Actions{j},2)*unfold(Actions{j},2)';
      Phi3 = Phi3 + unfold(Actions{j},3)*unfold(Actions{j},3)';
end

[V,~] = eig(Phi1);
U_1 = V(:,1:fix(size(V,2)/3) + 7)';

[V,~] = eig(Phi2);
U_2 = V(:,1:fix(size(V,2)/3) + 10)';

[V,~] = eig(Phi3);
U_3 = V(:,1:fix(size(V,2)/3))';
