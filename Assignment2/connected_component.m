% connected_component.m contains the implementation of the main routine for Question 1 in Assignment 2. 
% This function search for all connected component on the input image. It should output the total number of
% connected components, number of pixels in each connected component and
% display the largest connected component. Note that you are not allow to
% use the bwlabel/bwlabeln/bwconncomp matlab built-in function in this
% question.

function connected_component()
    %Read the input image and convert it to binary image (0,1)
    IM = imread('cc_image.jpg');
    BW = im2bw(IM);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% TODO_1: Search for all connected components with connectivity equals
	% to 8 and output the result to the command window in following format:
    % There are total {number of regions} region(s) :
    % Region 1, no. of pixels = {number of pixels}
    % Region 2, no. of pixels = {number of pixels}
    % ...
    
    padded_BW = padarray(BW, [1 1]);
    region = zeros(size(BW));
    [sizeX, sizeY] = size(BW);
    visited = false(size(BW));
    flag = 0;
    for i=2:sizeX
        for j=2:sizeY
            if padded_BW(i, j) == 0 || visited(i, j)
                continue;
            else
                stack = [i, j];
                flag = flag + 1;
                while ~isempty(stack)
                    cur = stack(1, :);
                    stack(1, :) = [];
                    if visited(cur(1), cur(2))
                        continue;
                    end
                    region(cur(1), cur(2)) = flag;
                    visited(cur(1), cur(2)) = true;
                    for k=cur(1)-1:cur(1)+1
                        for p=cur(2)-1:cur(2)+1
                            if padded_BW(k, p) == 0
                                visited(cur(1), cur(2)) = true;
                                continue;
                            end
                            stack = [stack; [k, p]];
                        end
                    end
                end
            end
        end
    end
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% TODO_2: Find the largest connected component in binary format (0,1).
	% L_CC = ??
    vals = unique(region);
    disp(['There are total ', num2str(length(vals)),' region(s) :']);
    max_cc = 0;
    max_v = vals(1);
    for v=2:length(vals)
        cc = sum(region(:)==vals(v));
        if cc > max_cc
            max_cc = cc;
            max_v = vals(v);
        end
        disp(['Region ', num2str(vals(v)) ,', no. of pixels = ', num2str(cc)]);
    end
    
    L_CC = region;
    L_CC(L_CC ~= max_v) = 0;
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    figure;
    subplot(1,2,1);imshow(BW);title('Input image');
    subplot(1,2,2);imshow(L_CC);title('Largest connected component');
    
end

