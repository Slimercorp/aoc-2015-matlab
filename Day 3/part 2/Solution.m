clear; clc;
fid = fopen('input.txt', 'r');
F = fread(fid, inf, 'char');
fclose(fid);
%%
i1 = 0; i2 = 0;
j1 = 0; j2 = 0;
B = [0 0];
l = 0;

for k=1:length(F)
    thereis = false;
    if mod(k,2) == 0
        if F(k) == 62
            j1 = j1 + 1;
        elseif F(k) == 94
            i1 = i1 + 1;
        elseif F(k) == 118
            i1 = i1 - 1;
        elseif F(k) == 60
            j1 = j1 - 1;
        end
        
        for h=1:max(l,1)
            if B(h,1) == i1 && B(h,2) == j1
                thereis = true;
                break;
            end
        end
            
        if ~thereis
            l = l + 1;
            B(l,1) = i1;
            B(l,2) = j1;
        end
        
    else
        if F(k) == 62
            j2 = j2 + 1;
        elseif F(k) == 94
            i2 = i2 + 1;
        elseif F(k) == 118
            i2 = i2 - 1;
        elseif F(k) == 60
            j2 = j2 - 1;
        end
        
        for h=1:max(l,1)
            if B(h,1) == i2 && B(h,2) == j2
                thereis = true;
                break;
            end
        end
            
        if ~thereis
            l = l + 1;
            B(l,1) = i2;
            B(l,2) = j2;
        end
        
    end
end
%%
thereis = false;
for h=1:max(l,1)
    if B(h,1) == 0 && B(h,2) == 0
        thereis = true;
        break;
    end
end

if thereis
    l
else
    l + 1
end