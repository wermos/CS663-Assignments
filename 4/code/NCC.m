function ncc = NCC(I1, I2)
    I1_average = mean(I1, "all");
    I2_average = mean(I2, "all");

    I1 = I1 - I1_average;
    I2 = I2 - I2_average;

    numerator = sum(times(I1, I2), "all");
    
    denom1 = sum(times(I1, I1), "all");
    denom2 = sum(times(I2, I2), "all");
    
    ncc = abs(numerator / sqrt(denom1 * denom2));
end