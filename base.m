blink = csvread('F0000CH2.CSV',0,3,[0,3,2499,4]);
cdc = csvread('F0002CH2.CSV',0,3,[0,3,2499,4]);
cuc = csvread('F0001CH2.CSV',0,3,[0,3,2499,4]);
ud = csvread('F0003CH2.CSV',0,3,[0,3,2499,4]);
bl = csvread('BottomLeft.csv',2,0);
br = csvread('BottomRight.csv',2,0);
tl = csvread('TopLeft.csv',2,0);
tr = csvread('TopRight.csv',2,0);

figure(1)
subplot(1,4,1);
plot(blink(:,1),blink(:,2)*22);
title('Blink');

subplot(1,4,2);
plot(cdc(:,1),cdc(:,2));
title('centre-down-centre');

subplot(1,4,3);
plot(cuc(:,1),cuc(:,2));
title('centre-up-centre');

subplot(1,4,4);
plot(ud(:,1),ud(:,2));
title('up-down');

figure(2)
subplot(1,4,1);
plot(bl(:,1),[bl(:,2) bl(:,3)]);
title('bottom left');

subplot(1,4,2);
plot(br(:,1),[br(:,2) br(:,3)]);
title('bottom right');

subplot(1,4,3);
plot(tl(:,1),[tl(:,2) tl(:,3)]);
title('top left');

subplot(1,4,4);
plot(tr(:,1),[tr(:,2) tr(:,3)]);
title('top right');