% @Author Yuhan Mao
function recommend_items = p_recommend_list( predicted_ratings,first_m )
% first_m represents the number of items that would appear in the
% recommendation list
% RUN THIS 18TH
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
[temp,position] = sort(predicted_ratings, 2, 'descend');
position = position(:, 1:first_m);
recommend_items = struct([]);

for i = 1:first_m
    recommend_items(i).itemlist = position(i, :); 
end

for i = 1:first_m
    itemlist_i = recommend_items(i).itemlist;
    X = sprintf('recommended items for user %d', i);
    disp(X);
    disp(itemlist_i);
end

end

