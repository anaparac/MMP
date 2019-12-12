load_persons
low_rank = [5,5,4];

B_matrices = cell(size(Persons));

for i = 1 : size(Persons, 1)
    B_matrices{i} = hooi( Persons{i}, low_rank,10);
end