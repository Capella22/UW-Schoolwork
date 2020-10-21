clear all; close all; clc

Directory = 'yalefaces_cropped\CroppedYale';
Subfolders = dir(fullfile(Directory, '*'));
%disp(Subfolders(3).name)

Datamtx = [];

for i = 3 : numel(Subfolders) % first two elements are '.' and '..'
    Fulldirectory = fullfile(Directory, Subfolders(i).name);
    %disp(Fulldirectory)
    Imagelist = dir(fullfile(Fulldirectory,'*.pgm')); % not using images ending with pgm.bad
    %disp([i,numel(Imagelist)])
    for j = 1 : numel(Imagelist)
        Imagefile = fullfile(Fulldirectory, Imagelist(j).name);
        Image = imread(Imagefile);
        %disp(size(Image))
        Reshaped = reshape(Image, 192*168, 1); %reshape each image into a column vector
        Datamtx = [Datamtx Reshaped];
        %disp(size(Datamtx))
    end
end

save('cropped data.mat','Datamtx');
