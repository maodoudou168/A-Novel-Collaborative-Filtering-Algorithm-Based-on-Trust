% @Author Yuhan Mao
function nearest_neighbors = p_selecting_neighbors( TrustSim, k, num_user )
% RUN THIS 16TH
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
nearest_neighbors = cell(num_user, 1);
for i=1:size(TrustSim)
    TrustSim(i,i) = 0;
end

for i = 1:size(TrustSim)
    temp = TrustSim(i, :);
    [index, neighbor] = sort(temp, 'descend');
    neighbor = cat(2, neighbor', index');
    neighbor = neighbor(1:k, :);
    nearest_neighbors{i,1} = neighbor;
end

end

