% @Author Yuhan Mao
function MAE = v_MAE( predicted_ratings, useritem )
% RUN THIS 19TH
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

% find out the items that has been originally rated by user u
with_rate = useritem ~= 0;

predicted_ratings = predicted_ratings.* with_rate;
numerator = abs(predicted_ratings - useritem);
numerator = sum(sum(numerator));
denominator = sum(sum(double(with_rate)));
MAE = numerator ./ denominator;
disp(MAE);

end

