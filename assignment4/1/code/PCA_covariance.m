function [eigenvectors, avg] = PCA_covariance(data, k)
    % `data` must be a matrix of dimensions (wh × I) where w is the width
    % of the image, h is the height, and I is the number of images.
    %
    % Each column of `data` corresponds to one image. The image matrix,
    % whose dimensions are w x h, is flattened to a wh × 1 vector. All
    % these image column vectors are then put one after the other in `data`.

    % this returns a column vector containing the mean of each row, which
    % is precisely what we need here.
    avg = mean(data, 2);
    
    xi = data - avg;

    % naive covariance implementation
    % [num_rows, num_cols] = size(data);
    % 
    % covariance = zeros(num_rows);
    % 
    % for i = 1:num_cols
    %     covariance = covariance + xi(:, i) * xi(:, i)';
    % end
    % 
    % covariance = 1 / (num_cols - 1) * covariance;

    % the cov function expects the columns to be the random variables and
    % the rows to be observations (i.e., image data in this case)
    covariance = cov(xi');

    % debug print stuff
    % disp(size(covariance));

    [eigenvectors, ~] = eigs(covariance, k);
end