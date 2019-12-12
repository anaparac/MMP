
test_list = [8,9,10];
num_face = size(test_list,2);

Test_ourfaces = zeros(112,92, num_face);
index = 0;

New_persons = 5;


for person = 41 : 40 + New_persons
    for expression= 1 : num_face
        index = index + 1;
        % hardkodiramo da uzimamo samo 10. ekspresiju za testiranje
        path = strcat('orl_faces/s',  num2str(person, '%d'),'/' , num2str(test_list(expression),'%d'),'.pgm');
        selectedImage = imread(path);
        if( person > 40)
            selectedImage = rgb2gray(selectedImage);
        end
        Test_ourfaces(:,:,index) = normalize(double(selectedImage));
    end
end


% Test_faces - tenzor test slika
prediction = zeros(size(Test_ourfaces,3),1);

num_expression = size(B_matrices{1},3);

seq = [];
for i = 41 : 40 + New_persons
    for j = 1 : num_face
        seq = [seq, i];
    end
end

for test_picture = 1 : size(Test_ourfaces,3)
    residual = zeros(size(B_matrices));
    
    for B = 1 : size(B_matrices,1)      
        suma = 0;
        
        ekspresije = zeros(3,1);
        for expression = 1 : num_expression  
            %suma = suma + sum(sum(times(Test_faces(:,:,test_picture), B_matrices{B}(:,:,expression))));
            %minimalna ekspresija
            ekspresije(expression) = norm(Test_ourfaces(:,:,test_picture) - B_matrices{B}(:,:,expression));         
            
            %suma svih ekspresija
            %residual(B)  = residual(B) +  norm(Test_faces(:,:,test_picture) - B_matrices{B}(:,:,expression));         
        end
        
        % za minimum
        [residual(B), eks] = min(ekspresije);  
        
        % iz clanka
        %residual(B) = norm(1 - suma);
        
    end
    [M,I] = min(residual);
    prediction(test_picture) = I;
    

   subplot(1,3,1), imagesc(Test_ourfaces(:,:,test_picture));
   subplot(1,3,2), imagesc(B_matrices{I}(:,:,eks)); 
   subplot(1,3,3), imagesc(Persons{I}(:,:,eks)); 
   pause(0.75);
end


counter = 0;
for i = 1 : size(Test_ourfaces,3)
    if (seq(i) == prediction(i))
        counter = counter +1;
    end
end

counter / size(Test_ourfaces,3)