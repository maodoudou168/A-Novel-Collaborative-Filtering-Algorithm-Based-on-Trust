% @Author Yuhan Mao
function user_average = f_user_average( useritem )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


summing = sum(useritem, 2)';
counting = sum(double(useritem ~= 0), 2)';
user_average = summing ./counting;

end

