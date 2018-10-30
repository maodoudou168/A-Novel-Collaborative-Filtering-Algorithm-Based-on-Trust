% @Author Yuhan Mao
function OverallTrust = t_overall_trust( DirectTrust_u_v, IndirectTrust,lambda )
% RUN THIS 13TH
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
OverallTrust = lambda * DirectTrust_u_v + (1 - lambda) * IndirectTrust;
end

