% flip_torque=transpose(torque1);
% angle1=rad2deg(climb_up_torque_range(:,1))
% angle2=rad2deg(climb_up_torque_range(:,2))
% angle3=rad2deg(climb_up_torque_range(:,3))
% 
% figure(1)
% subplot(2,1,1);
% xc=climb_up_torque_range(:,5);
% yc=climb_up_torque_range(:,4);
% plot(xc,yc,'o');
% axis([0,1.3,-1,1]);
% 
% subplot(2,1,2);
% xf=flip_torque_range(:,5);
% yf=flip_torque_range(:,4);
% plot(xf,yf,'o');
% axis([0,1.3,-1,1]);

figure(2)
x1=3
for i=1:length(flip_torque_range)
y1(i)=flip_torque_range(i,5);
t1(i)=flip_torque_range(i,4);
if(t1(i)==-1)
    plot(x1,y1(i),'bx');
    hold on
elseif(t1(i)==0)
    plot(x1,y1(i),'b^');
    hold on
else
    plot(x1,y1(i),'bo');
    hold on
end
end
x2=6;
for i=1:length(climb_up_torque_range)
y2(i)=climb_up_torque_range(i,5)
t2(i)=climb_up_torque_range(i,4)
if(t2(i)==-1)
    plot(x2,y2(i),'bx');
    hold on
elseif(t2(i)==0)
    plot(x2,y2(i),'b^');
    hold on
else
    plot(x2,y2(i),'bo');
    hold on
end
end

xr1=2:0.01:4;
yr1=1;
xr2=5:0.01:7;
yr2=0.9;
plot(xr1,yr1,'ro',xr2,yr2,'ro');
set(gca,'xtick',[3 6]);
set(gca,'xticklabel',{'servo3','servo5'});

axis([0,9,0,1.3]);