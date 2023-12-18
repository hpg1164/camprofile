clc
clear
close all
a = 2; b = 5;
%point p1
P1 = [0 0 ];
%parameter of the plot 
axis(gca,'equal'); %The aspect ratio
axis([-2 7 -2 3]); %The limits

%The angular spped of the crank in rad/s
k = 1;
% apply loop
for t = 1:500 %t isd the time in tenths od secomds
    theta = k*(t/10);
    % the point p2
    P2 = a*[cos(theta) sin(theta)];
    %angle alfa
    alfa = asin(a*sin(theta)/b);
    %point p3
    P3 = [(a*cos(theta) + b*cos(alfa)) 0]
    %the crank line
    crank = line([P1(1),P2(1)],[P1(2) P2(2)]);
    %slider line
    slider =  line([P2(1),P3(1)],[P2(2) P3(2)]); 
    %the poinr p2 trajectory 
    p2_traj = viscircles([0 0],a,'Linestyle','--');
    %point p1 and p2
    P1_circ = viscircles(P1, 0.1);
    P2_circ = viscircles(P2, 0.1);
    P3_circ = viscircles(P3 ,0.1);
    %The intervalto update the plot
    pause(0.001);
    %delete the previous line
    delete(crank);
    delete(P1_circ);
    delete(P2_circ);
    delete(P3_circ);
    delete(slider);
end