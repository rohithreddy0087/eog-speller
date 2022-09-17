bl = csvread('BottomLeft.csv',2,0);
br = csvread('BottomRight.csv',2,0);
tl = csvread('TopLeft.csv',2,0);
tr = csvread('TopRight.csv',2,0);
bnk = csvread('F0000CH2.CSV',0,3,[0,3,2499,4]);

a = -0.1;
b = 0.1;
r = (b-a).*rand(1,400) + a;

%%Blink
sig_blink = zeros(300,3);
sig_blink(1:300,1) = tr(1:300,1);
sig_blink(1:300,2) = bnk(851:1150,2)*22;
sig_blink(1:300,3) = bnk(851:1150,2)*22;

%%Up
sig_up = zeros(400,3);
sig_up(1:400,1) = tr(1:400,1);
sig_up(:,2) = tr(951:1350,2) - 2;
sig_up(:,3) = r;

%%Down
sig_dn = zeros(400,3);
sig_dn(1:400,1) = bl(1:400,1);
sig_dn(:,2) = bl(1101:1500,2) - 2;
sig_dn(:,3) = r;

%%Right
sig_rt = zeros(400,3);
sig_rt(1:400,1) = tr(1:400,1);
sig_rt(:,2) = r;
sig_rt(:,3) = tr(951:1350,3) - 3;

%%Left
sig_lt = zeros(400,3);
sig_lt(1:400,1) = bl(1:400,1);
sig_lt(:,2) = r;
sig_lt(:,3) = bl(1101:1500,3) - 3;


%%Top Right
sig_tr = zeros(400,3);
sig_tr(1:400,1) = tr(1:400,1);
sig_tr(:,2) = tr(951:1350,2) - 2;
sig_tr(:,3) = tr(951:1350,3) - 3;

%%Top Left
sig_tl = zeros(400,3);
sig_tl(1:400,1) = tl(1:400,1);
sig_tl(:,2) = tl(576:975,2) - 2;
sig_tl(:,3) = tl(576:975,3) - 3;

%%Bottom Right
sig_br = zeros(400,3);
sig_br(1:400,1) = br(1:400,1);
sig_br(:,2) = br(576:975,2) - 2;
sig_br(:,3) = br(576:975,3) - 3;

%%Bottom Left
sig_bl = zeros(400,3);
sig_bl(1:400,1) = bl(1:400,1);
sig_bl(:,2) = bl(1101:1500,2) - 2;
sig_bl(:,3) = bl(1101:1500,3) - 3;

figure(1)
subplot(2,4,1);
plot(sig_bl(:,1),[sig_bl(:,2) sig_bl(:,3)]);
title('bottom left');

subplot(2,4,2);
plot(sig_br(:,1),[sig_br(:,2) sig_br(:,3)]);
title('bottom right');

subplot(2,4,3);
plot(sig_tl(:,1),[sig_tl(:,2) sig_tl(:,3)]);
title('top left');

subplot(2,4,4);
plot(sig_tr(:,1),[sig_tr(:,2) sig_tr(:,3)]);
title('top right');

subplot(2,4,5);
plot(sig_up(:,1),[sig_up(:,2) sig_up(:,3)]);
title('Up');

subplot(2,4,6);
plot(sig_dn(:,1),[sig_dn(:,2) sig_dn(:,3)]);
title('Down');

subplot(2,4,7);
plot(sig_rt(:,1),[sig_rt(:,2) sig_rt(:,3)]);
title('Right');

subplot(2,4,8);
plot(sig_lt(:,1),[sig_lt(:,2) sig_lt(:,3)]);
title('Left');

figure(2)
plot(sig_blink(:,1),[sig_blink(:,2) sig_blink(:,3)]);
title('Blink');