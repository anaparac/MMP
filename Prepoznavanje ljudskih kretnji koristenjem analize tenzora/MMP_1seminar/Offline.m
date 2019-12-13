%------------------------------------------------------------------------
% Offline
%------------------------------------------------------------------------
Preprocessing;
Initialization;
Local_optimization;

Projections = cell(size(Actions, 2), 1);
for i = 1 : size(Actions, 2)
    Projections{i} = mul_t(mul_t(mul_t(Actions{i}, U_1, 1), U_2, 2), U_3, 3);
end