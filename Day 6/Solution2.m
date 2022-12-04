clear; clc;
fid = fopen('input.txt');
result = 0;
lights = zeros(1000,1000);
while 1
    tline = fgetl(fid);
    if ~ischar(tline)
        break
    end
    
    indexs = find(tline == ' ');
    command = tline(1:indexs(1)-1);
    
    if strcmp(command, 'turn')
        command2 = tline(indexs(1)+1:indexs(2)-1);
        arg1 = tline(indexs(2)+1:indexs(3)-1);
        arg2 = tline(indexs(4)+1:end);
        
        indexs = find(arg1 == ',');
        fromI = str2num(arg1(1:indexs(1)-1)) + 1;
        fromJ = str2num(arg1(indexs(1)+1:end)) + 1;
        
        indexs = find(arg2 == ',');
        toI = str2num(arg2(1:indexs(1)-1)) + 1;
        toJ = str2num(arg2(indexs(1)+1:end)) + 1;
        
        if strcmp(command2, 'on')
            for i=fromI:toI
                for j=fromJ:toJ
                    lights(i,j) = lights(i,j) + 1;
                end
            end
        elseif strcmp(command2, 'off')
             for i=fromI:toI
                for j=fromJ:toJ
                    lights(i,j) = max(lights(i,j) - 1, 0);
                end
            end
        end
    elseif strcmp(command, 'toggle')
        arg1 = tline(indexs(1)+1:indexs(2)-1);
        arg2 = tline(indexs(3)+1:end);
        
        indexs = find(arg1 == ',');
        fromI = str2num(arg1(1:indexs(1)-1)) + 1;
        fromJ = str2num(arg1(indexs(1)+1:end)) + 1;
        
        indexs = find(arg2 == ',');
        toI = str2num(arg2(1:indexs(1)-1)) + 1;
        toJ = str2num(arg2(indexs(1)+1:end)) + 1;
        for i=fromI:toI
            for j=fromJ:toJ
                lights(i,j) = lights(i,j) + 2;
            end
        end
    end
end
fclose(fid);

for i=1:1000
    for j=1:1000
        result = result + lights(i,j);
    end
end

result
