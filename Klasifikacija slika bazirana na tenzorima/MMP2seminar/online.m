load_test

% Test_faces - tenzor test slika
prediction = zeros(size(B_matrices));

num_expression = size(B_matrices{1},3);


seq = [];
for i = 1 : 40
    for j = 1 : num_face
        seq = [seq, i];
    end
end

for test_picture = 1 : size(Test_faces,3)
    residual = zeros(size(B_matrices));
    
    for B = 1 : size(B_matrices,1)      
        suma = 0;
        
        ekspresije = zeros(3,1);
        for expression = 1 : num_expression  
            %suma = suma + sum(sum(times(Test_faces(:,:,test_picture), B_matrices{B}(:,:,expression))));
            %minimalna ekspresija
            ekspresije(expression) = norm(Test_faces(:,:,test_picture) - B_matrices{B}(:,:,expression));         
            
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
    
    if ( prediction(test_picture) ~= seq(test_picture) )
       subplot(1,3,1), imagesc(Test_faces(:,:,test_picture));
       subplot(1,3,2), imagesc(B_matrices{I}(:,:,eks)); 
       subplot(1,3,3), imagesc(Persons{I}(:,:,eks)); 
       pause(0.25);
    end
end


counter = 0;
for i = 1 : size(Test_faces,3)
    if (seq(i) == prediction(i))
        counter = counter +1;
    end
end

counter/size(Test_faces,3)