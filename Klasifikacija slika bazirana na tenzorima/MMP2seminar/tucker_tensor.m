function [B] = tucker_tensor(lambda, U)
        B = mul_t(mul_t( mul_t(lambda,U{1},1) , U{2}, 2), U{3}, 3);    
end

