Persons = cell(45,1);

learned_expression = 8;
Face = zeros(112,92, learned_expression);


for person = 1 : 45
    for expression = 1 : learned_expression
        path = strcat('orl_faces/s', num2str(person, '%d') , '/' ,num2str(expression, '%d'), '.pgm');
        selectedImage = imread(path);
        if( person > 40)
            selectedImage = rgb2gray(selectedImage);
        end
        Face(:,:,expression) = normalize(double(selectedImage ));
    end
    Persons{person} = Face;
end


% mod1 = unfold(Persons{2},2);
% [U,S,V] = svd(mod1);
% svojstvene = diag(S);
% omjeri = zeros(size(svojstvene));
% for i = 1 : size(svojstvene)
%    omjeri(i) = sum(svojstvene(i:end))/sum(svojstvene);
% end
% plot(linspace(1,92,92), omjeri);