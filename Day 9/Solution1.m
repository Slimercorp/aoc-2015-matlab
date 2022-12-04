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
    data{i,2} = tline(indexs(2)+1:indexs(3)-1);
    data{i,3} = tline(indexs(4)+1:end);
end
fclose(fid);
%% вычисление необходимых городов для посещения и их удобный шифр
cities = cell(1);
size = 0;
for i=1:length(data)
    exist = false;
    for j=1:max(size,1)
        if strcmp(data{i,1}, cities{j,1})
            exist = true;
            break;
        end
    end
    if ~exist
        size = size + 1;
        cities{size,1} = data{i,1};
    end
    
    exist = false;
    for j=1:max(size,1)
        if strcmp(data{i,2}, cities{j,1})
            exist = true;
            break;
        end
    end
    if ~exist
        size = size + 1;
        cities{size,1} = data{i,2};
    end
end
M = containers.Map(cities, int32(1:length(cities)));


%% перевод данных в карту расстояний
map = zeros(length(cities), length(cities)) - 1;
for i=1:length(data)
    map(M(data{i,1}), M(data{i,2})) = str2num(data{i,3});
    map(M(data{i,2}), M(data{i,1})) = str2num(data{i,3});
end
%% составление всех комбинаций
combinations = perms(1:length(cities));
minDist = inf;
for i=1:length(combinations)
    sum = 0;
    for j=2:8
        sum = sum + map(combinations(i,j-1),combinations(i,j));
    end
    
    if minDist > sum
        minDist = sum;
    end
end

minDist