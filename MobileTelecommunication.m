%=====��߶�˥�������Ĺ�ϵ=====%
f=875;
v=4;
lambda=(3*10^8)/(875*10^6);
ht=25;hr=2;
delta_h=ht-hr;
pt=10;Pt=10*log10(pt);
sigma=8;
d=4;
D1=-8:0.05:8;
D1(:,161)=[];
alpha=3.2*(log10(11.75*hr))^2-4.97;
Lp1=69.55+26.16*log10(f)-13.82*log10(ht)-alpha+(44.9-6.55*log10(ht))*log10(D1);
zeta=normrnd(0,sigma,1,320);
%zeta=lognrnd(0,sigma,[1,320]);
L1=Lp1+zeta;
figure(1);
plot(D1,L1);title('ͼ1  ��߶�˥�䡪��������');
xlabel('����(Km)');ylabel('��߶�˥��(dB)');
hold on;
plot(D1,Lp1,'r');legend('��߶�˥��(·�����+��Ӱ˥��)','��ֵ(·�����)');
hold off;
grid on;

%=====������Ƶ�������Ĺ�ϵ=====%
alpha=linspace(0,0,320);
for count=1:320
    if D1(1,count)<0
        alpha(1,count)=atan(-delta_h/D1(count));
    else
        alpha(1,count)=pi-atan(delta_h/D1(count));
    end
end

delta_f=v*cos(alpha)/lambda;
figure(2);
plot(D1,delta_f);title('ͼ2  ������Ƶ�ơ���������');
xlabel('����(Km)');ylabel('������Ƶ��(Hz)');
grid on;

%=====���߸߶ȶ�·����ĵ�Ӱ��=====%
for n=1:7
    Ht=10*n;
    alpha=3.2*(log10(11.75*hr))^2-4.97;
    Lp1=69.55+26.16*log10(f)-13.82*log10(Ht)-alpha+(44.9-6.55*log10(Ht))*log10(D1);
    zeta=normrnd(0,sigma,1,320);
    L1=Lp1+zeta;
    figure(3);hold on;grid on;
    plot(D1,Lp1);title('ͼ3  ·����ġ���������');
    xlabel('����(Km)');ylabel('·�����(dB)');
    hold off;
end
legend('Ht=10m','Ht=20m','Ht=30m','Ht=40m','Ht=50m','Ht=60m','Ht=70m');