% @Author Yuhan Mao
function pearson_sim = z_pearson_corr( useritem )
% RUN THIS 14TH
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[num_user, num_item] = size(useritem);
numerator = 0;
denominator_1 = 0;
denominator_2 = 0;
pearson_sim = zeros(num_user, num_user);

for i = 1:num_user
    for j = 1:num_user
        useritem_i = useritem(i, :);
        useritem_j = useritem(j, :);
        useritem_inter_i = useritem_i((useritem(i, :) ~= 0) & (useritem(j, :) ~= 0));
        useritem_inter_j = useritem_j((useritem(i, :) ~= 0) & (useritem(j, :) ~= 0));
        if size(useritem_inter_i,2) > 1
            aver_i = sum(useritem_inter_i);
            aver_j = sum(useritem_inter_j);
            for m = 1:size(useritem_inter_i, 2)
                numerator = numerator + (useritem_inter_i(m) - aver_i) * (useritem_inter_j(m) - aver_j);
                denominator_1 = denominator_1 + (useritem_inter_i(m) - aver_i)^2;
                denominator_2 = denominator_2 + (useritem_inter_j(m) - aver_j)^2;
            end
            denominator_1 = denominator_1^0.5;
            denominator_2 = denominator_2^0.5;
            pearson_sim(i, j) = numerator / (denominator_1 * denominator_2);
            disp(i);
            disp(j);
        end
        numerator = 0;
        denominator_1 = 0;
        denominator_2 = 0;
    end
end


end

