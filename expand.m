% expand an image by reproducing low-energy seams
function J = expand(I, num_rows_expanded, num_cols_expanded) 
expand = [num_rows_expanded, num_cols_expanded]; % function arguments in a matrix
sz = size(I);
for m = 1:2 % double image vertically, then horizontally
    if expand(m) < 1
        continue;
    end;
    I = [I;zeros(size(I,1),size(I,2),size(I,3))];
    for i = (size(I,1)/2):-1:1
        for j = 1:size(I,2)
            for k = 1:size(I,3)
                I(2*i,j,k) = I(i,j,k);
                I(2*i-1,j,k) = I(i,j,k);
            end
        end
    end 
end
if (expand(1) > 0)
    I = shrink(I,sz(1)-expand(1),0);
end
if (expand(2) > 0)
    I = shrink(I,0,sz(2)-expand(2));
end
J = I;
end
