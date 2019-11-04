%=====大尺度衰落与距离的关系=====%
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
plot(D1,L1);title('图1  大尺度衰落—距离曲线');
xlabel('距离(Km)');ylabel('大尺度衰落(dB)');
hold on;
plot(D1,Lp1,'r');legend('大尺度衰落(路径损耗+阴影衰落)','均值(路径损耗)');
hold off;
grid on;

%=====多普勒频移随距离的关系=====%
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
plot(D1,delta_f);title('图2  多普勒频移—距离曲线');
xlabel('距离(Km)');ylabel('多普勒频移(Hz)');
grid on;

%=====天线高度对路径损耗的影响=====%
for n=1:7
    Ht=10*n;
    alpha=3.2*(log10(11.75*hr))^2-4.97;
    Lp1=69.55+26.16*log10(f)-13.82*log10(Ht)-alpha+(44.9-6.55*log10(Ht))*log10(D1);
    zeta=normrnd(0,sigma,1,320);
    L1=Lp1+zeta;
    figure(3);hold on;grid on;
    plot(D1,Lp1);title('图3  路径损耗—距离曲线');
    xlabel('距离(Km)');ylabel('路径损耗(dB)');
    hold off;
end
legend('Ht=10m','Ht=20m','Ht=30m','Ht=40m','Ht=50m','Ht=60m','Ht=70m');