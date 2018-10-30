% @Author Yuhan Mao
function profession_coef = z_profession_coef( profession_standard, num_user, num_topic )
% RUN THIS 7TH
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
profession_coef = zeros(num_user, num_topic);


% counting the items under each topic for user u
for i = 1:size(profession_standard)
    profession_coef(profession_standard(i,1),profession_standard(i,3)) = profession_coef(profession_standard(i,1),profession_standard(i,3)) + 1;
end

for j = 1:num_topic
    topic_j = sum(profession_coef(:,j));
    for i = 1:num_user
        profession_coef(i, j) = profession_coef(i, j) / topic_j;
    end
end

end

