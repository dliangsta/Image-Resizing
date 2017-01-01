% wrapper function for gradient of an RGB version of an image
function J = imenergy(I)
J = imgradient(rgb2gray(I)); 
end


