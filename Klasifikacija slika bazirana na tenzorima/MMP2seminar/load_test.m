
test_list = [8,9,10];
num_face = size(test_list,2);

Test_faces = zeros(112,92, 40*num_face);
index = 0;



for person = 1 : 40
    for expression= 1 : num_face
        index = index + 1;
        % hardkodiramo da uzimamo samo 10. ekspresiju za testiranje
        path = strcat('orl_faces/s', num2str(person,'%d'),'/', num2str(test_list(expression),'%d'),'.pgm');
        selectedImage = imread(path);
        Test_faces(:,:,index) = normalize(double(selectedImage));
        %subplot(1,2,1), imagesc(selectedImage);
        %subplot(1,2,2), imagesc(double(selectedImage));
        %pause(0.5);
    end
end