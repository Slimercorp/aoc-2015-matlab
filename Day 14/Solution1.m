clear; clc;
%% парсинг
fid = fopen('input.txt');
data = cell(8,3);
i = 0;
while 1
    tline = fgetl(fid);
    if ~ischar(tline)
        break;
    end
    
    i = i + 1;
    indexs = find(tline == ' ');
    data{i,1} = tline(1:indexs(1)-1);
    data{i,2} = tline(indexs(3)+1:indexs(4)-1);
    data{i,3} = tline(indexs(6)+1:indexs(7)-1);
    data{i,4} = tline(indexs(13)+1:indexs(14)-1);
end
fclose(fid);
%% вычисление необходимых городов для посещения и их удобный шифр
t = 0;
distance = zeros(9,1);
movement = zeros(9,1) + 1;
timeOfMovementStart = zeros(9,1);
timeOfRestStart = zeros(9,1);
while (1)
    
    t = t + 1;
    
    for i=1:9
        if movement(i)
            distance(i) = distance(i) + str2num(data{i,2});
        end
        
        if (t - timeOfMovementStart(i)) == str2num(data{i,3}) && movement(i)
             timeOfRestStart(i) = t;
             movement(i) = false;
        end
        
        if (t - timeOfRestStart(i)) == str2num(data{i,4}) && ~movement(i)
             timeOfMovementStart(i) = t;
             movement(i) = true;
        end
            
    end
    
    
    if t == 2503
        break;
    end
    
end

max(distance)