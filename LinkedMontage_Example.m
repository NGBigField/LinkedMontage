% Example for using LinkedMontage:
% ===============================
%
% LinkedMontage A tight Montage that also links the images with linkaxes()
%[SubPlotHandleArray , options] = LinkedMontage( ImCell, TitleStrArray , options )
% 
% This function plots multiple images side by side like montage(), 
% but does it using subplot that are conneced with linkaxes() function. This
% allows user to zoom into images and move around, while all images move together.
% Function also returns the handles to all the subplots, so user can change properties later.
%
%
% Copyright (c) 2020 Nir Gutman
% Free to use. See LICENSE.

%% Clear Workspace:
clearvars; close all; clc;
%% Prepare mages:
% Load an iamage:
OriginalImage = imread('peppers.png');
% Do some manipulations:
GrayImage = rgb2gray(OriginalImage);
EdgeImage = edge(GrayImage,'canny');
%%  Montages comparison::
% built-in montage:
FigH_builtin = figure();
montage( {OriginalImage,GrayImage,EdgeImage} )
title("Built in monage");
FigH_builtin.Name = "Built in monage Figure Handle";
%% Linked Montage Without extra options and without titles. Same syntax as build-in montage():
FigH_linkedMontage = figure();
FigH_linkedMontage.Name = "LinkedMontage Figure Handle";
[SubPlotHandleArray , options] = LinkedMontage( {OriginalImage,GrayImage,EdgeImage} );
% Observe the output arguments:
disp(options);
disp(options.FigureHandle.Name)
% zoom in to see the effect of linkaxes():  % can also be done manually:
FirstImageAxes = SubPlotHandleArray(1);
zoom(FirstImageAxes,5);
%% Linked Montage with extra options:
% override the existing built-in montage figure called "FigH_builtin" by using the "FigureHandle" option.
% Force all images to be in one row using the "Layout" option.
[X,map] = imread('corn.tif');
OriginalImage = ind2rgb(X,map);
% Do some manipulations:
GrayImage = rgb2gray(OriginalImage);
HSV = rgb2hsv(OriginalImage);
SaturationImage = HSV(:,:,2);
EdgeImage = edge(GrayImage,'canny');

LinkedMontage( {OriginalImage   , GrayImage   , SaturationImage   } , ...
               ["Original Image", "Gray Image", "Saturation Image"] , ...
               "FigureHandle" , FigH_builtin , ...
               "Layout" , [ 1 , nan]                               );
%% Linked Montage with extra options:
% Force a 2 by 2 grid using the "Layout" option.
% Turn Off Linked axes using the "LinkedAxes" , "off" option.
% set the images to be smaller than fully tiled, using the ImageRelativeSize option.
                                          
figure(); % new figure this time...
SubPlotHandleArray = LinkedMontage( {OriginalImage   , GrayImage   , SaturationImage   , EdgeImage   } , ...
                                    ["Original Image", "Gray Image", "Saturation Image", "Edge Image"] , ...
                                    "Layout" , [ inf , 2]  , ...
                                    "LinkedAxes" , "off" , ...
                                    "ImageRelativeSize" , 0.7                                       );                                            
% zoom in to one image without effect to the others:
ThirdImageAxes = SubPlotHandleArray(3);
zoom(ThirdImageAxes,5);