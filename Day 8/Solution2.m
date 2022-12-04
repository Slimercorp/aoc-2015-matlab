clear; clc;
%% парсинг
fid = fopen('input.txt');
charactersOld = 6310;
characters = 0;

while 1
    tline = fgetl(fid);
    if ~ischar(tline)
        break;
    end
    
    characters = characters + length(tline) + 4;

    i = 1;
    while 1
        i = i + 1;
        if tline(i) == '\'
            if tline(i+1) == '\'
                 i = i + 1;
                 characters = characters + 2;
            elseif tline(i+1) == '"'
                 i = i + 1;
                 characters = characters + 2;
            elseif tline(i+1) == 'x'
                 i = i + 3;
                 characters = characters + 1;
            end
        end
        
        if (i + 1) > length(tline) - 1
            break;
        end
    end
end
fclose(fid);

characters - charactersOld