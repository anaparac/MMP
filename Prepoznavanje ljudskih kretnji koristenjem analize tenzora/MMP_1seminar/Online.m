%------------------------------------------------------------------------
% Online
%------------------------------------------------------------------------

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


tocni = 0;
svi = 0;

for testna_akcija = 1 : length(stringovi)
    testFiles = dir(strcat('test\*',stringovi{testna_akcija}));
    
    for testni_video = 1 : length(testFiles)      
        backName = testFiles(testni_video).name;
        path = strcat('test\', testFiles(testni_video).name);
        disp(testFiles(testni_video).name);
        Detect_action
    end
    
end
