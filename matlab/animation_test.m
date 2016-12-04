L1 = 8; L4 = 8;
L2 = 15; L3 = 15;

t = [0 1 2 3 4 5 6];
tt = 0:0.01:6;
x = [25 32*cos(pi/6) 39*cos(pi/3) 0 -39*cos(pi/3) -32*cos(pi/6) -25];
y = [0 32*sin(pi/6) 39*sin(pi/3) 46 39*sin(pi/3) 32*sin(pi/6) 0];
sx = spline(t,[0,x,0],tt);
sy = spline(t,[0,y,0],tt);
%plot(x,y,'O',sx,sy);
theta = [180 120 60 0 -60 -120 -180];
theta1 = [56.4427,23.1301,-3.0579,0,3.0579,-23.1301,-56.4427];
theta2 = [67.1146,73.7398,66.1158,0,-66.1158,-73.7398,-67.1146];
theta3 = [56.4427,23.1301,-3.0579,0,3.0579,-23.1301,-56.4427];
theta1 = pi*theta1/180;theta2 = pi*theta2/180;theta3 = pi*theta3/180;

s1 = spline(t,theta1,tt);
%figure;plot(t,theta1,'O',tt,s1);
s2 = spline(t,theta2,tt);
%figure;plot(t,theta2,'O',tt,s2);
s3 = spline(t,theta3,tt);
%figure;plot(t,theta3,'O',tt,s3);

x = L2*sin(s1)+L3*sin(s1+s2)+L4*sin(s1+s2+s3);
y = L1+L2*cos(s1)+L3*cos(s1+s2)+L4*cos(s1+s2+s3);


for i = 1:600
    p1 = [0 8];
    link1_end = line([8,-8],[0,0],'LineWidth',3,'Color','b');
    link1 = line([0 0],[0 8],'LineWidth',3,'Color','b');
    p2 = p1 + L2*[cos(pi/2-s1(i)),sin(pi/2-s1(i))];
    p3 = p2 + L3*[cos(pi/2-s1(i)-s2(i)),sin(pi/2-s1(i)-s2(i))];
    p4 = p3 + L4*[cos(pi/2-s1(i)-s2(i)-s3(i)),sin(pi/2-s1(i)-s2(i)-s3(i))];
    
    plot(x,y,'LineStyle','--','LineWidth',2,'Color','r');
    xlim([-35 35]);
    hold on;
    c = plot(p1(1),p1(2),'O',p2(1),p2(2),'O',p3(1),p3(2),'O',p4(1),p4(2),'O')
    
    p4l = p4 + 8*[cos(pi-s1(i)-s2(i)-s3(i)),sin(pi-s1(i)-s2(i)-s3(i))];
    p4r = p4 + 8*[cos(2*pi-s1(i)-s2(i)-s3(i)),sin(2*pi-s1(i)-s2(i)-s3(i))];
    
    
    link2 = line([0,p2(1)],[8,p2(2)],'LineWidth',3,'Color','b');
    link3 = line([p2(1),p3(1)],[p2(2),p3(2)],'LineWidth',3,'Color','b');
    link4 = line([p3(1),p4(1)],[p3(2),p4(2)],'LineWidth',3,'Color','b');
    link4_end = line([p4l(1),p4r(1)],[p4l(2),p4r(2)],'LineWidth',3,'Color','b');
    pause(0.000001);
    if i<600
        delete(link2);
        delete(link3);
        delete(link4);
        delete(link4_end);
        delete(c);
    end
end

for i=1:51
    [image,map]=frame2im(frames(i+1));
    [im,map2]=rgb2ind(image,128);
    if i==1
        imwrite(im,map2,'move_pic.gif','gif','writeMode','overwrite','delaytime',dt,'loopcount',inf);
    else
        imwrite(im,map2,'move_pic.gif','gif','writeMode','append','delaytime',dt);
    end
end



