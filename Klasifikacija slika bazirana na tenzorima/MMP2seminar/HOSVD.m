function [ S, U1, U2, U3 ] = HOSVD( A )
    [U1, S1, V1] = svd(unfold_1(A));
    [U2, S2, V2] = svd(unfold_2(A));
    [U3, S3, V3] = svd(unfold_3(A));

    S = mul_t( mul_t( mul_t(A, U1', 1), U2', 2), U3', 3);
end

