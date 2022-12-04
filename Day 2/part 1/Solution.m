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
    area = 2*a*b + 2*b*c + 2*c*a + min(a*b,min(b*c,c*a));
    result = result + area;
end
fclose(fid);

result