%  As for all objects in MATLAB, structs are in fact
%  arrays of structs, where a single struct is an 
%  array of shape (1, 1)


% Label the colorbar
hcb=colorbar
title(hcb,'title')
%%

% Stop crashing when plotting:
% run with an extra flag
./matlab -softwareopengl
%%

% comment
ctrl+r 
% uncomment 
ctrl+t
%%

% end a script without closing matlab
return

% save not display
set(gcf,'visible','off')

% string concatenation: str1 + str2
strcat(str1, str2) 


% test fscanf
x = 1 : 1 : 5
y = [x; rand(1, 5)];

fileID = fopen('nums2.txt','w');
fprintf(fileID,'%d %4.4f\n',y);
fclose(fileID);

fileID = fopen('nums2.txt','r');

formatSpec = '%d %f';
sizeA = [2 Inf];

A = fscanf(fileID, formatSpec, sizeA)
fclose(fileID);

A = A'

%%


% OWN COLORMAP
 function mymap = colormapRGBmatrices( N, rm, gm, bm)
  x = linspace(0,1, N);
  rv = interp1( rm(:,1), rm(:,2), x);
  gv = interp1( gm(:,1), gm(:,2), x);
  mv = interp1( bm(:,1), bm(:,2), x);
  mymap = [ rv', gv', mv'];
  %exclude invalid values that could appear
  mymap( isnan(mymap) ) = 0;
  mymap( (mymap>1) ) = 1;
  mymap( (mymap<0) ) = 0;
end
%
MR=[0,0; 
    0.02,0.3; %this is the important extra point
    0.3,1;
    1,1];
MG=[0,0;
    0.3,0; 
    0.7,1;
    1,1];
MB=[0,0; 
    0.7,0;
    1,1];
hot2 = colormapRGBmatrices(500, MR, MG, MB);
%
imagesc(x, y, P);
colormap (hot2);
%%


%
line = fgetl(fid); % returns the next line of the specified file, removing the newline characters
while line(1) == '#'
  line = fgetl(fid);
end
%%

% reads file data into an array, A, with dimensions, sizeA, and 
%  (!!!!)positions the file pointer after the last value read (!!!!).
%  fscanf populates A in column order.
A = fscanf(fileID, formatSpec, sizeA) % 
%%



%
clear  %  removes all variables from the current workspace, releasing them from system memory.
clc    %  clear screen
%%

%{
This is a
block comment
%}

% mozna przekazac do funkcji jako argument funkcję 'inline':
f = @(x)x^2
%
function funkcja(f)
	f(0);
end
%%



x = x(x >= mean(x));   -  instead of the loop

ctrl + r  - comment (also multiple) lines

ctrl + c  (pressed in command window) - abort evaluation


I want to delete the rows of this matrix when the elements of the 5th column are equal to 0
A = [ 5 3 3 1 4; 6 6 3 1 0; 6 2 2 2 0; 4 2 3 2 0; 1 1 1 1 2 ]
A( A(:,5)== 0,: ) = []

N = ndims(A) - number of array dimensions

%%
contourf(x,y,W,100,'LineStyle','none'); 100 - liczba izolinii
colormap(jet)  -  rainbow from red to blue
%%

%
nUnknown=2;  % The number of unknown arrays
myArray = zeros(5,5,nUnknown);

subMatrix = myArray(:,:,2)

%myArray = cat(3,myArray,zeros(5,5));
% OR
myArray(:,:,nUnknown+1) = zeros(5,5)

%%



% Handling the number of function's input arguments 
function plot_section(section, subtitle) % dx, sampling
if nargin < 2 
   subtitle = ''; % in this particular case: if no subtitle argument is passed, set it to empty string
end
%%
