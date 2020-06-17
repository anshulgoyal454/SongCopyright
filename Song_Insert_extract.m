clc
clear all
close all
disp("Perform Operation\n")

x=input('1. Insert\n2. Extract\n-->');
if(x==1)
    watermarkThis(1)
    watermarkThis(2)
    watermarkThis(3)
    watermarkThis(4)
elseif x==2
    fileName=input('\nEnter watermark to search: ','s');
    a=extractThis(fileName);
   [num,txt,raw] = xlsread('Database.xlsx')
   raw(3,a)
    
else 
    disp("\nWrong Input\n");
    
end
