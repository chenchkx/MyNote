% https://ww2.mathworks.cn/help/fuzzy/gaussmf.html?s_tid=srchtitle#mw_0aa9ef1c-06b1-4cd2-b0ec-9c6377e9542a
% 

clear;
clc;

x = 0:0.1:10;
y = gaussmf(x,[2 5])/(sqrt(2*pi)*2);
plot(x,y)
xlabel('gaussmf, P=[2 5]')
ylabel('gaussmf')
legend('gaussmf'); %Ìí¼ÓÍ¼Àı´úÂë

%  example in matlab toolkit
if 0
    x = (0:0.1:10)';
    y1 = gaussmf(x, [0.5 5]);
    y2 = gaussmf(x, [1 5]);
    y3 = gaussmf(x, [2 5]);
    y4 = gaussmf(x, [3 5]);
    subplot(211); plot(x, [y1 y2 y3 y4]);
    y1 = gaussmf(x, [1 2]);
    y2 = gaussmf(x, [1 4]);
    y3 = gaussmf(x, [1 6]);
    y4 = gaussmf(x, [1 8]);
    subplot(212); plot(x, [y1 y2 y3 y4]);
end

%  example in for 2 dimension 
% ezmesh('exp(-(x^2+y^2))')




