% boundary_extraction.m contains the implementation of main routine for Question
% 1 in Assignment 2. This function uses erosion to obtain the boundary of different objects. 
% Note that you are not allowed to use the matlab built-in function such as
% imfilter, imerode or any third-party function in this question.

function boundary_extraction()

    % Read the input image and convert it to binary image
    IM = imread('image.jpg');
    img = im2bw(IM);
    % Display the input image
    figure;
    imshow(img);title('Input image');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % TODO_1: Apply erosion on the image
    % img_erode = ??
    
    padded_img = padarray(img, [1 1]);
    [sizeX, sizeY] = size(img);
    img_erode = zeros(size(padded_img));

    for i=2:sizeX
        for j=2:sizeY
            flag = 1;
            for k=-1:1
                for p=-1:1
                    flag = flag & padded_img(i+k, j+p);
                end
            end
            img_erode(i, j) = flag;
        end
    end

    img_erode = img_erode(2:sizeX+1, 2:sizeY+1);


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % TODO_1: Apply erosion on the image
    % img_boundary = ??
    
    img_boundary = img - img_erode;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Display the input image
    figure;
    imshow(img_boundary);title('Boundary image');

end
    
    
    
    