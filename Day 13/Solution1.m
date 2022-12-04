clear; clc;
%% �������
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
    data{i,2} = tline(indexs(end)+1:end-1);
    if strcmp(tline(indexs(2)+1:indexs(3)-1), 'lose')
        data{i,3} = ['-',tline(indexs(3)+1:indexs(4)-1)];
    else
        data{i,3} = tline(indexs(3)+1:indexs(4)-1);
    end
end
fclose(fid);
%% ���������� ����������� ������� ��� ��������� � �� ������� ����
people = cell(1);
size = 0;
for i=1:length(data)
    exist = false;
    for j=1:max(size,1)
        if strcmp(data{i,1}, people{j,1})
            exist = true;
            break;
        end
    end
    if ~exist
        size = size + 1;
        people{size,1} = data{i,1};
    end
    
    exist = false;
    for j=1:max(size,1)
        if strcmp(data{i,2}, people{j,1})
            exist = true;
            break;
        end
    end
    if ~exist
        size = size + 1;
        people{size,1} = data{i,2};
    end
end
M = containers.Map(people, int32(1:length(people)));


%% ������� ������ � ����� ����������
map = zeros(length(people), length(people)) - 1;
for i=1:length(data)
    map(M(data{i,1}), M(data{i,2})) = str2num(data{i,3});
end
%% ����������� ���� ����������
combinations = perms(1:length(people));
maxHappy = 0;
for i=1:length(combinations)
    sum = 0;
    for j=2:8
        sum = sum + map(combinations(i,j-1),combinations(i,j));
        sum = sum + map(combinations(i,j),combinations(i,j-1));
    end
    sum = sum + map(combinations(i,8),combinations(i,1));
    sum = sum + map(combinations(i,1),combinations(i,8));
    
    if maxHappy < sum
        maxHappy = sum;
    end
end

maxHappy