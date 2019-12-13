function [Y] = unfold(X, mode)
    dim = size(X);
    dim1 = dim(1);
    dim2 = dim(2);
    dim3 = dim(3);
    Y = zeros(dim1, dim2*dim3);
    d = 1;
    
    switch mode
        
        case 1
            Y = zeros(dim1, dim2*dim3);
            for i = 1:dim3
               pom = d+dim2-1;
               Y(:, d:pom) = X(:,:,i); 
               d = d + dim2;
            end
            
        case 2
            Y = zeros(dim2, dim1*dim3);
            for i = 1:dim3
               pom = d+dim1-1;
               Y(:, d:pom) = X(:,:,i)'; 
               d = d + dim1;
            end
      
        case 3
            Y = zeros(dim3, dim1*dim2);
            for i = 1:dim2
               pom = d+dim1-1;
               A = X(:,i,:);
               Y(:,d:pom) = squeeze(A)';
               d = d + dim1;
            end        
    end
end
