%% Initialization
clear ; close all; clc
load('ex3weights.mat');
%img_rgb = imread("myDigit.jpg");
p = imageTo20X20Gray('myDigit.jpg',:,-1);
