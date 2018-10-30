% @Author Yuhan Mao
function item_average = f_item_average( useritem )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


summing = sum(useritem, 1)';
counting = sum(double(useritem ~= 0), 1)';
item_average = summing ./counting;

end

