fid = fopen('input.txt', 'r');
F = fread(fid, inf, 'char');
fclose(fid);
%%
floor = 0;
for i=1:length(F)
    if F(i) == 40
        floor = floor + 1;
    else
        floor = floor - 1;
    end
    
    if floor == -1
        break;
    end
end
%%
i