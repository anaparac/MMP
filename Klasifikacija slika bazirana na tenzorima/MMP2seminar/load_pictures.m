Faces = zeros(112,92,400);
index = 0;
for person = 1 : 40
    for expression= 1 : 10
        index = index + 1;
        path = strcat('orl_faces/s', num2str(person,'%d'),'/', num2str(expression,'%d'),'.pgm');
        selectedImage = imread(path);
        Faces(:,:,index) = normalize(double(selectedImage));
    end
end

% mod1 = unfold(Faces(:,:,1:10),3);
% [U,S,V] = svd(mod1);
% svojstvene = diag(S);
% omjeri = zeros(size(svojstvene));
% for i = 1 : size(svojstvene)
%    omjeri(i) = sum(svojstvene(i:end))/sum(svojstvene);
% end
% plot(linspace(1,10,10), omjeri);