clear; clc;
fid = fopen('input.txt');
result = 0;
while 1
    tline = fgetl(fid);
    if ~ischar(tline)
        break
    end
    
    indexs = find(tline == 'x');
    a = str2num(tline(1:indexs(1)-1));
    b = str2num(tline(indexs(1)+1:indexs(2)-1));
    c = str2num(tline(indexs(2)+1:end));
    length = min(2*(a+b),min(2*(a+c), 2*(b+c)));
    volume = a * b * c;
    result = result + length + volume;
end
fclose(fid);

result