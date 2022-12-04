puzzle = 'ckczppom';
found = false;
number = 0;
while ~found
    number = number + 1;
    string = [puzzle, num2str(number)];
    Hash = DataHash(string,'MD5','ascii', 'HEX');
    if strcmp(Hash(1:5), '00000')
        found = true;
        break;
    end      
end

number