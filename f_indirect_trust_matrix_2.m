% @Author Yuhan Mao
function [IndirectTrust2_matrix, IndirectTrust2_denominator] = f_indirect_trust_matrix_2( DirectTrust_u_v, num_user )

% 
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% 2 steps indirect trust

for i = 1:num_user
    DirectTrust_u_v(i,i) = 0; 
end

% find user's one step neighbors
link_1 = cell(num_user, 1);

for i = 1:num_user
    link_1{i, 1} = find(DirectTrust_u_v(i, :) ~= 0);
end

IndirectTrust2_matrix = zeros(size(DirectTrust_u_v));
IndirectTrust2_denominator = zeros(size(DirectTrust_u_v));
for u = 1:num_user
    neighbor_u = link_1{u,1}; % current user(subject) is u
    for j = 1:size(neighbor_u,2)
        middle_user = neighbor_u(1,j); % middle user is user_u(1, j)
        neighbor_k = link_1{middle_user, 1}; % find the trust network of the middle user
        for i = 1:size(neighbor_k,2)
            object_user = neighbor_k(1, i);
            IndirectTrust2_matrix(u, object_user) = IndirectTrust2_matrix(u, object_user) + DirectTrust_u_v(u, middle_user) * DirectTrust_u_v(middle_user, object_user);
            IndirectTrust2_denominator(u, object_user) = IndirectTrust2_denominator(u, object_user) + DirectTrust_u_v(u, middle_user);
        end
    end
end
for i = 1:num_user
    IndirectTrust2_matrix(i,i) = 0; 
end
IndirectTrust2_matrix = IndirectTrust2_matrix * 0.667;

end

