% @Author Yuhan Mao
function DirectTrust_u_v = t_direct_trust( combined_trust, useritem, profession_standard, num_user, num_item )
% RUN THIS 11TH
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

aver = sum(useritem, 2)./ sum(double(useritem ~= 0), 2);
DirectTrust_u_v = zeros(num_user, num_user);
profession_refer = zeros(num_user, num_item);

profession_standard = sortrows(profession_standard, 1);

% 生成一个professional查询表，对应某用户对某item是在某topic下发表的评论
for u = 1:size(profession_standard)
    profession_refer(profession_standard(u,1), profession_standard(u,2))=profession_standard(u,3); % under different topics, a user would have different combined trust, thus should recognize the item at first
end

% u,v,i
for u = 1:num_user
    for v = 1:num_user
        for i = 1:num_item
            if profession_refer(v,i) ~= 0 && profession_refer(u,i) ~=0 && u ~= v
                predict_rating = aver(u, 1) + combined_trust(v, profession_refer(v,i)) * (useritem(v,i) - aver(v, 1));
                prewatch = useritem(u,i);
                if abs(predict_rating-useritem(u,i)) < 2
                    DirectTrust_u_v(u, v) = DirectTrust_u_v(u, v) + 1;
                end
            end
        end
    end
end



useritem = double(useritem ~= 0);
common = useritem * useritem';

DirectTrust_u_v = DirectTrust_u_v./common;
DirectTrust_u_v(isnan(DirectTrust_u_v)) = 0;
DirectTrust_u_v(isinf(DirectTrust_u_v)) = 0;

end

