Faces = zeros(112,92,400);

index = 0;
for person = 1 : 40
    for expression = 1 : 10
        index = index + 1;
        path = strcat('orl_faces/s', num2str(person, '%d') , '/' ,num2str(expression, '%d'), '.pgm');
        selectedImage = imread(path);
        Faces(:,:,index) = selectedImage;
    end
end
