% usage of plot3

x=[0.2,1.8,2.5];
y=[1.3,2.8,1.1];
z=[0.4,1.2,1.6];
figure(1);plot3(x,y,z);
grid on;
axis([0,3,1,3,0,2])%设置三个坐标轴的显示范围


%% 蝴蝶结， z=2*x.^2+y.^2
t=0:pi/360:2*pi;
x=sin(t);
y=cos(t);
z=2*x.^2+y.^2;
figure
plot3(x,y,z,'Color','r','LineWidth',2);
xlabel('x');
ylabel('y');
zlabel('z');
title('z=(cos t)^2+2*(sin t)^2');
axis([-1.2 1.2 -1.2 1.2 1 2.2]);


%% 螺旋线， 
t = linspace(0,10*pi,200);
x = sin(t)+t.*cos(t);
y = cos(t)+t.*sin(t);
z = t;
subplot(1,2,1);
plot3(x,y,z);
grid on
subplot(1,2,2);
plot3(x(1:4:200),y(1:4:200),z(1:4:200));
grid on




