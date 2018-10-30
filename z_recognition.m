% @Author Yuhan Mao
function recognition = z_recognition( useritem, num_user )
% RUN THIS 9TH
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
recog = rand(size(useritem));
recog = double(recog > 0.2);
useritem = double(useritem ~= 0);
recog = recog.* useritem;

recognition = zeros(size(useritem,1),1);

for i = 1:num_user
    recognition(i,1) = sum(recog(i, :)) / sum(useritem(i, :));
end

end

