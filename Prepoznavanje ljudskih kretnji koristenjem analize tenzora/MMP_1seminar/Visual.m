
% Iscrtavanje 
% 
test_video = VideoReader('snimke\moshe_jack.avi');
numFrames = test_video.NumberOfFrames;    
bgName = fname2bgname('moshe_jack.avi');
back = VideoReader(bgName);
backgroundMask = read(back,3);
tensor = zeros(test_video.Height, test_video.Width, numFrames);
height_frame = 78; 
width_frame = 50;

%iscrtavanje frameova
 for k = 1:numFrames
     img = rgb2gray(read(test_video, k));
     imagesc(img);
     pause(0.02);
 end


%  %iscrtavanje crno bijelog frameova
%  for k = 1:numFrames
%      img = read(test_video, k); 
%      img = backgroundMask - img;
%      img = 1 - im2bw(img, graythresh(img));
%      imshow(img);
%      pause(.02);
%  end
%  
%  
%  
%  %iscrtavanje izrezanih silueta 
%  for k = 1:numFrames
%      temp = read(test_video, k);
%      temp = backgroundMask - temp;
% 
%      img2 = im2bw(temp, graythresh(temp));
%      s = regionprops(img2, 'boundingBox' );
%      if size(s,1) < 1
%          end_ = end_ + 1;
%          continue
%      end
%      boundingBoxs = cat(1, s.BoundingBox);
%      boundingBoxs_ind = 1; 
%      boundingBoxs_value = boundingBoxs(1, 4);
% 
%      for i = 2 : size(s, 1)
%          if  boundingBoxs(i, 4) > boundingBoxs_value
%              boundingBoxs_value = boundingBoxs(i, 4);
%              boundingBoxs_ind = i;
%          end
%      end
% 
%      height_img = boundingBoxs(boundingBoxs_ind, 4);
%      width_img = boundingBoxs(boundingBoxs_ind, 3);
% 
%      if width_img < 10 || height_img < 30
%          end_ = end_ + 1;
%          continue
%      end
% 
%      img2 = 1 - img2;
% 
%      x = round(boundingBoxs(boundingBoxs_ind, 1));
%      y = round(boundingBoxs(boundingBoxs_ind, 2));
% 
%      if mod(width_frame,2) ~= mod(width_img,2)
%          width_img = width_img + 1;
%      end
% 
%      missing_x = (width_frame - width_img) / 2;
% 
%      y_1 = y - (height_frame- height_img); 
%      y_2 = y+height_img;
% 
%      x_1 = x - missing_x; 
%      x_2 = x + width_img + missing_x; 
% 
%      if x_1 <= 0
%          x_1 = 1; 
%          x_2 = 1 + width_frame;
%      end
%      if x_2 > size(img2 ,2)
%          x_2 = size(img2 ,2); 
%          x_1 = size(img2 ,2) - width_frame;  
%      end
%      if y_1 <= 0
%          y_1 = 1; 
%          y_2 = 1 + height_frame; 
%      end
% 
%      img_izrezana = img2( y_1 : y_2 , x_1 : x_2);
%      imshow(img_izrezana);
%      pause(.02);
%  end
 
%------------------------------------------------------------------------
% Naši podaci
%------------------------------------------------------------------------


% Iscrtavanje 
% 
test_video = VideoReader('nas_video\petra_bend.avi');
numFrames = test_video.NumberOfFrames;    
back = VideoReader('nas_video\faks1_bg.avi');
backgroundMask = read(back,3);
tensor = zeros(test_video.Height, test_video.Width, numFrames);
height_frame = 78; 
width_frame = 50;

%iscrtavanje frameova
 for k = 1:numFrames
     img = rgb2gray(read(test_video, k));
     imagesc(img);
     pause(0.02);
 end


 %iscrtavanje crno bijelog frameova
 for k = 1:numFrames
     img = read(test_video, k); 
     img = backgroundMask - img;
     img = 1 - im2bw(img, graythresh(img));
     imshow(img);
     pause(.02);
 end
 
 
 
 %iscrtavanje izrezanih silueta 
 for k = 1:numFrames
     temp = read(test_video, k);
     temp = backgroundMask - temp;

     img2 = im2bw(temp, graythresh(temp));
     s = regionprops(img2, 'boundingBox' );
     if size(s,1) < 1
         end_ = end_ + 1;
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
         y_1 = size(img2, 1) - visina_framea;
     end

     img_izrezana = img2( y_1 : y_2 , x_1 : x_2);
     imshow(img_izrezana);
     pause(.02);
 end
 
 
 