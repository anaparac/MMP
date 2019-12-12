function [ A ] = ttm(A, U, n)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    k = size(n,2);
    for i = 1:k
        A = mul_t(A,U{n(i)},n(i));
    end
end

