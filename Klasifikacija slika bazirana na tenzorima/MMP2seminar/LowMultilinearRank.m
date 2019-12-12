% computing best low multilinear rank for training tenzors

S = cell(size(Persons));
U1 = cell(size(Persons));
U2 = cell(size(Persons));
U3 = cell(size(Persons));

% obtaining initial estimates 
for i = 1 : size(Persons,1)
    [S{i}, U1{i}, U2{i}, U3{i}] = HOSVD(Persons{i});
end


% converging

