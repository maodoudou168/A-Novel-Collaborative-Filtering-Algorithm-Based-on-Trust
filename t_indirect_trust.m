% @Author Yuhan Mao
function IndirectTrust = t_indirect_trust( DirectTrust_u_v, num_user )
% RUN THIS 12TH
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[IT2_numerator, IT2_denominator] = f_indirect_trust_matrix_2(DirectTrust_u_v, num_user);
[IT3_numerator, IT3_denominator] = f_indirect_trust_matrix_3(DirectTrust_u_v, num_user);
IndirectTrust = (IT2_numerator + IT3_numerator) ./ (IT2_denominator + IT3_denominator);
end

