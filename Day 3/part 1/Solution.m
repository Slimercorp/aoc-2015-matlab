clear; clc;
fid = fopen('input.txt', 'r');
F = fread(fid, inf, 'char');
fclose(fid);
%%
floor = 0;
i = 0;
j = 0;
B = [0 0];
l = 0;
for k=1:length(F)
    if F(k) == 62
        j = j + 1;
    elseif F(k) == 94
        i = i + 1;
    elseif F(k) == 118
        i = i - 1;
    elseif F(k) == 60
        j = j - 1;
    end
    
    thereis = false;
    for h=1:max(l,1)
        if B(h,1) == i && B(h,2) == j
            thereis = true;
            break;
        end
    end
    
    if ~thereis
        l = l + 1;
        B(l,1) = i;
        B(l,2) = j;
    end
    
end
%%
l + 1