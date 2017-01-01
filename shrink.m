function J = shrink(I, num_rows_removed, num_cols_removed)
remove = [num_rows_removed, num_cols_removed]; % function arguments in a matrix
for m = 1:2 % horizontally, then vertically
    for i = 1:remove(m) % 1:num_rows_removed then 1:num_cols_removed
        disp((i/remove(m)+(m-1))/2); % progress indicator
        S = horizontal_seam(imenergy(rgb2gray(I))); % get seams
        for j = 1:size(I,2) % for each column, remove the particular pixel
            for k = 1:3 % for each color chanel, remove the particular pixel
                for l = (S(j)):(size(I,1)-1) % for each pixel below the removed pixel, move it up
                    I(l,j,k) = I(l+1,j,k);
                end
            end
            endzz
        I = I(1:size(I,1)-1,:,:); % trash bottom row
    end
    I = permute(I, [2 1 3]); % rotation for vertical, and then back
end
J = I;
end