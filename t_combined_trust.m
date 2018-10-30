% @Author Yuhan Mao
function combined_trust = t_combined_trust( profession_coef, recognition, user_authority, wp, wr, wa, num_topic )
% RUN THIS 10TH
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
recognition = repmat(recognition, 1, num_topic);
user_authority = repmat(user_authority, 1, num_topic);

% Calculate combined trust of a user classified by topics
combined_trust = wp * profession_coef + wr * recognition + wa * user_authority;
end

