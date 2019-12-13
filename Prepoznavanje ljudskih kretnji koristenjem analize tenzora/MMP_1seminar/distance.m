function [dist] = distance( X, Y)
    dist = 0;
      
    Z = X - Y;
    for i = 1 : size(X,1)
       for j = 1 : size(X,2)
           for k = 1 : size(X,3)
            dist = dist + Z(i,j,k)^2;
           end
       end 
    end
    %dist  = dist / (size(X,1)*size(X,2)*size(X,3));
    dist = sqrt(dist);
end

