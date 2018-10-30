% @Author Yuhan Mao
function [IndirectTrust3_matrix,IndirectTrust3_denominator] = f_indirect_trust_matrix_3( DirectTrust_u_v, num_user )

% 
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% 2 steps indirect trust

% find user's one step neighbors
link_d = cell(num_user, 1);

for i = 1:num_user
    link_d{i, 1} = find(DirectTrust_u_v(i, :) ~= 0);
end

% link_in2 = cell(num_user, 1);
% for i = 1:num_user
%     link_in2{i, 1} = find(IndirectTrust2_matrix(i, :) ~= 0);
%     link_in2{i, 1}(link_in2{i, 1} ~= i);
% end

IndirectTrust3_matrix = zeros(size(DirectTrust_u_v));
IndirectTrust3_denominator = zeros(size(DirectTrust_u_v));
for u = 1:num_user
    neighbor_u = link_d{u,1}; % current user(subject) is u
    for j = 1:size(neighbor_u,2)
        user_m = neighbor_u(1,j); % middle user is user_u(1, j)
        neighbor_m = link_d{user_m, 1}; % find the trust network of the middle user
        for i = 1:size(neighbor_m,2)
            user_n = neighbor_m(1, i);
            neighbor_n = link_d{user_n, 1};
            for k = 1:size(neighbor_n,2)
                object_user = neighbor_n(1,k);
                IndirectTrust3_matrix(u, object_user) = IndirectTrust3_matrix(u, object_user) + DirectTrust_u_v(u, user_m) * DirectTrust_u_v(user_m, user_n) * DirectTrust_u_v(user_n, object_user);
                IndirectTrust3_denominator(u, object_user) = IndirectTrust3_denominator(u, object_user) + DirectTrust_u_v(u, user_m);
            end
        end
    end
end
for i = 1:num_user
    IndirectTrust3_matrix(i,i) = 0; 
end
IndirectTrust3_matrix = IndirectTrust3_matrix * 0.667;

end

