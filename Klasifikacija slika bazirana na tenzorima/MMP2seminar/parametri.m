low_rank1 = [20,30,40, 20,30,40];
low_rank2 = [20,30,40, 20,30,40];
low_rank3 = [2,2,2,3,3,3];
rezultati  = zeros(6);

for iteracija = 1 : 6
    low_rank = [low_rank1(iteracija),low_rank2(iteracija),low_rank3(iteracija)];
    offline
    online 
    rezultati(iteracija) = counter / 120;
end