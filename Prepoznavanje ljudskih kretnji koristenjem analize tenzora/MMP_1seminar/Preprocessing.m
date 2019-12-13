%------------------------------------------------------------------------
% Preprocessing
%------------------------------------------------------------------------

% Ucitavanje
stringovi{1} = 'wave1.avi';
stringovi{2} = '_jump.avi';
stringovi{3} = 'walk.avi';
stringovi{4} = 'wave2.avi';
stringovi{5} = 'skip.avi';
stringovi{6} = 'bend.avi';
stringovi{7} = 'pjump.avi';
stringovi{8} = 'run.avi';
stringovi{9} = 'side.avi';
stringovi{10} = 'jack.avi';

pom = 0;
height_frame = 78; 
width_frame = 50;

for akcija = 1 : length(stringovi)
    Files = dir(strcat('snimke\*',stringovi{akcija}));
    
    for k=1:length(Files)       
    
        % Dohvacamo ime pozadine
        bgName = fname2bgname(Files(k).name);
        back = VideoReader(bgName);
        backgroundMask = read(back,3);

        % Uèitavamo video
        v = VideoReader(strcat('snimke\',Files(k).name));
        numFrames = v.NumberOfFrames;

        number = fix(numFrames/20);
        tenzor = zeros(height_frame+1, width_frame+1, 20);
        end_ = 20;
        start_ = 1;
        while end_ < numFrames
            pom = pom + 1;             
            for j = start_ : end_

                 temp = read(v, j);
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

                 img_izrezana = img2( y_1 : y_2 , x_1 : x_2);
                 tenzor(:,:,(j+1)-start_) = img_izrezana;
           end
           start_ = end_ - 10;
           end_ = start_ + 19;        
           Actions{pom} = tenzor;
           vektor_za_mapiranje(pom) = akcija;
        end  
    end
end

numVideo = length(Actions);

%trazimo srednji frame
AverageTensor = zeros(height_frame + 1, width_frame + 1, 20);
for k = 1:numVideo
    AverageTensor = AverageTensor + Actions{k};
end
AverageTensor = AverageTensor / numVideo;



% Iscrtavanje 


% iscrtavanje frameova
%  for k = 1:20
%      imshow(AverageTensor(:,:,k));
%      pause(.1);
%  end


%iscrtavanje frameova prvi video
% for k = 1:20
%     imagesc(Actions{1}(:,:,k));
%     pause(.1);
% end
