function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
% =============================================================
% cnt1 = 0;
% cnt2 = 0;
% cnt3 = 0;
% 
% for i = 1:length(idx)
%     switch idx(i)
%         case 1
%             cnt1 = cnt1+1;
%             centroids(1,:) = centroids(1,:) + X(i,:); 
%             
%         case 2
%             cnt2 = cnt2+1;
%             centroids(2,:) = centroids(2,:) + X(i,:);
%                         
%         case 3
%             cnt3 = cnt3+1;
%             centroids(3,:) = centroids(3,:) + X(i,:);
%         
%     end
% end
% centroids(1,:) = centroids(1,:)./cnt1;
% centroids(2,:) = centroids(2,:)./cnt2;
% centroids(3,:) = centroids(3,:)./cnt3;

cnt = zeros(K,1);

for i = 1:length(idx)
    centroids(idx(i),:) = centroids(idx(i),:) + X(i,:); 
    cnt(idx(i)) = cnt(idx(i)) + 1;
end
centroids = centroids ./cnt;


end


