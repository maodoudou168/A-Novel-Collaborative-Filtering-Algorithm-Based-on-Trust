% @Author Yuhan Mao
function user_authority = z_user_authority( useritem, num_item, num_user )
% RUN THIS 8TH
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

aver = zeros(1, num_item);
user_authority = zeros(num_user, 1);

% calculating the average rating for each item
for j = 1:num_item
    temp = useritem(:, j);
    count = sum(temp ~= 0);
    summing = sum(temp(temp ~= 0));
    aver(j) = summing / count;
end

aver = repmat(aver, num_user, 1);
user_auth = abs(useritem - aver);
user_auth = (user_auth < 0.5);
user_item = useritem ~= 0;

for i = 1:num_user
     user_authority(i) = sum(user_auth(i, :)) / sum(user_item(i, :));
end

