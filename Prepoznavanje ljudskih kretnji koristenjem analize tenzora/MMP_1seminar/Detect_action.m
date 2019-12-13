%------------------------------------------------------------------------
% Detect action
%------------------------------------------------------------------------


% Detektiranje našeg videa
% test_video = VideoReader('nas_video\sara_jack.avi');
% back = VideoReader('nas_video\faks1_bg.avi');
% backgroundMask = read(back,3);


% Detektiranje preuzetih videa
test_video = VideoReader(path);
bgName = fname2bgname(backName);
back = VideoReader(bgName);
backgroundMask = read(back,3);


numFrames = test_video.NumberOfFrames;
test_tenzor = zeros(height_frame + 1, width_frame + 1, 20);

start_ = 1;
end_ = 20;
while(end_ < numFrames)
    i_pom = 0;
    for i = start_ : end_
         i_pom = i_pom + 1;
         temp = read(test_video, i);
         temp = backgroundMask - temp;
         img2 = im2bw(temp, graythresh(temp));
         s = regionprops(img2, 'boundingBox' );
         if size(s,1) < 1
             end_ = end_ + 1;
             i_pom = i_pom - 1;
             continue
         end
         boundingBoxs = cat(1, s.BoundingBox);
         boundingBoxs_ind = 1; 
         boundingBoxs_value = boundingBoxs(1, 4);

         for i = 2 : size(s, 1)
             if  boundingBoxs(i, 4) > boundingBoxs_value
                 boundingBoxs_value = boundingBoxs(i, 4);
                 boundingBoxs_ind = i;
             end
         end

         height_img = boundingBoxs(boundingBoxs_ind, 4);
         width_img = boundingBoxs(boundingBoxs_ind, 3);

         if width_img < 10 || height_img < 30
             end_ = end_ + 1;
             i_pom = i_pom - 1;         
             continue
         end

         img2 = 1 - img2;

         x = round(boundingBoxs(boundingBoxs_ind, 1));
         y = round(boundingBoxs(boundingBoxs_ind, 2));

         if mod(width_frame,2) ~= mod(width_img,2)
             width_img = width_img + 1;
         end

         missing_x = (width_frame - width_img) / 2;

         y_1 = y - (height_frame- height_img); 
         y_2 = y+height_img;

         x_1 = x - missing_x; 
         x_2 = x + width_img + missing_x; 

         if x_1 <= 0
             x_1 = 1; 
             x_2 = 1 + width_frame;
         end
         if x_2 > size(img2 ,2)
             x_2 = size(img2 ,2); 
             x_1 = size(img2 ,2) - width_frame;  
         end
         if y_1 <= 0
             y_1 = 1; 
             y_2 = 1 + height_frame; 
         end

          if y_2 > size(img2, 1)
             y_2 = size(img2, 1);
             y_1 = size(img2, 1) - height_frame;
          end
     
         img_izrezana = img2( y_1 : y_2 , x_1 : x_2);             
         test_tenzor(:,:,i_pom) = img_izrezana; 
    end

    test_tenzor_projection =  mul_t(mul_t(mul_t(test_tenzor, U_1, 1), U_2, 2), U_3, 3);

    distances = zeros(size(Actions, 1),1);
    for i1 = 1:size(Actions, 2)
       distances(i1) = distance(test_tenzor_projection, Projections{i1});
    end

    [mini,ind] = min(distances);
    disp(stringovi{vektor_za_mapiranje(ind)});
    
    if (vektor_za_mapiranje(ind) == testna_akcija)
        tocni = tocni + 1;
    end
    
    svi = svi + 1;   
    start_ = end_ - 10;
    end_ = start_ + 19;   
end