% @Author Yuhan Mao
function predicted_ratings = p_rating_prediction( nearest_neighbors, useritem, k )
% RUN THIS 17TH
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
aver = f_user_average(useritem);
predicted_ratings = zeros(size(useritem));
[num_user, num_item] = size(useritem);

for u = 1:num_user
    aver_u = aver(u);
    neighbors = nearest_neighbors{u,1};
    for i = 1:num_item
        temp1 = 0;
        temp2 = 0;
        for v = 1:k
            ST = neighbors(v, 2);
            refer_user = neighbors(v, 1);
            if useritem(refer_user,i) ~= 0
                temp1 = temp1 + ST * (useritem(refer_user, i) - aver(refer_user));
                temp2 = temp2 + abs(ST);
            end
        end
        predicted_ratings(u, i) =  aver_u + temp1 / temp2;
    end
end
predicted_ratings(isnan(predicted_ratings)) = 0;

end

