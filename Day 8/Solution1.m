clear; clc;
%% парсинг
fid = fopen('input.txt');
characters = 0;
stringLit = 0;
while 1
    tline = fgetl(fid);
    if ~ischar(tline)
        break;
    end
    
    characters = characters + length(tline);
    if stringLit > 580
        gdfgdf = 0;
    end
    i = 1;
    while 1
        i = i + 1;
        if tline(i) == '\'
            if tline(i+1) == '\'
                 stringLit = stringLit + 1;
                 i = i + 1;
            elseif tline(i+1) == '"'
                stringLit = stringLit + 1;
                i = i + 1;
            elseif tline(i+1) == 'x'
                stringLit = stringLit + 1;
                i = i + 3;
            end
        else
            stringLit = stringLit + 1;
        end
        
        if (i + 1) > length(tline) - 1
            break;
        end
    end
end
fclose(fid);

characters - stringLit