clear; clc;
fid = fopen('input.txt');
result = 0;
vc = @(s) nnz(ismember(lower(s),'aeiou'));
while 1
    tline = fgetl(fid);
    if ~ischar(tline)
        break
    end
    cond1 = false;
    cond2 = false;
    cond3 = true;
    if vc(tline) >= 3
        cond1 = true;
    end
    
    for i=2:length(tline)
        if tline(i) == tline(i-1)
            cond2 = true;
            break;
        end
    end
    
    for i=2:length(tline)
        str = [tline(i-1), tline(i)];
        if strcmp(str,'ab') || strcmp(str,'cd') || strcmp(str,'pq') || strcmp(str,'xy')
            cond2 = false;
            break;
        end
    end
    
    if cond1 && cond2 && cond3 
        result = result + 1;
    end
    
end
fclose(fid);

result