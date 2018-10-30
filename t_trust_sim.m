% @Author Yuhan Mao
function TrustSim = t_trust_sim( OverallTrust, pearson_sim, miu )
% RUN THIS 15TH
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
TrustSim = miu * OverallTrust + (1 - miu) * pearson_sim;
end

