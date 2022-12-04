clear; clc;
fid = fopen('input.txt');
result = 0;
while 1
    tline = fgetl(fid);
    if ~ischar(tline)
        break
    end
    cond1 = false;
    cond2 = false;
    
    for i=2:length(tline)
        str = [tline(i-1),tline(i)];
        if i+2 <= length(tline)
            for j=i+2:length(tline)
                str2 = [tline(j-1),tline(j)];
                if strcmp(str,str2)
                    cond1 = true;
                    break;
                end
            end
        end
    end
    
    for i=3:length(tline)
        if strcmp(tline(i),tline(i-2))
            cond2 = true;
            break;
        end
    end
    
    if cond1 && cond2
        result = result + 1;
    end
    
end
fclose(fid);

result