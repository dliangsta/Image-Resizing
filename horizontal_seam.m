% remove the lowest enregy seam
function S = horizontal_seam(I)
I = imenergy(I);
sz = size(I); % dimensions of I
J = zeros(sz(1)+2,sz(2),2);
J(2:(1+sz(1)),1,1) = I(:,1);
J(1,:,1) = inf; % padding
J(end,:,1) = Inf; % padding
for j = 2:sz(2) % column
    for i = 2:(sz(1)+1) % row
        minneighborvalue = min(J(i-1,j-1,1),min(J(i,j-1,1),J(i+1,j-1,1))); % min value  
        if (minneighborvalue == J(i-1,j-1,1)) minneighbor = -1; % allow for finding neighbor
        elseif (minneighborvalue == J(i,j-1,1)) minneighbor = 0;
        elseif (minneighborvalue == J(i+1,j-1,1)) minneighbor = 1; 
        end
            
        J(i,j,1) = I(i-1,j) + minneighborvalue; % assign cumulative energy
        J(i,j,2) = minneighbor; % assign index of neighbor
    end
end
%saveas(imagesc(J(:,:,1)),'liang.2b.jpg');
S = zeros(sz(2),1);
[ ~ , seamindex] = min(J(:,sz(2),1));
for i = sz(2):-1:1 % backward track
    S(i) = seamindex;
    seamindex = seamindex + J(seamindex,i,2);
end
end

