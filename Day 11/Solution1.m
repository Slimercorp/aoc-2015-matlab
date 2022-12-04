%%
clear; clc;
password = 'hepxxyzz';
numbersOriginal = double(password);
numbers = double(password);

while 1
    
    % increment password
    i = length(numbers);
    while 1
        [numbers(i), excess] = incrementAndBound(numbers(i));
        if ~excess
            break;
        else
            i = i - 1;
        end
    end
    
    newPassword = char(numbers);
    %ñondition 1
    thereis = false;
    for j=3:length(numbers)
        if (numbers(j) == (numbers(j-1) + 1)) && (numbers(j) == (numbers(j-2) + 2))
            thereis = true;
            break;
        end
    end
    
    if ~thereis
        continue;
    else
        fgdf = 1;
    end
    
    %ñondition 2
    thereis = false;
    for j=1:length(numbers)
        if (char(numbers(j)) == 'i') || (char(numbers(j)) == 'o') || (char(numbers(j)) == 'l')
            thereis = true;
            break;
        end
    end
    
    if thereis
        continue;
     else
        fgdf = 1;
    end
    
    %cond3
    thereis = false;
    
    thereis1 = false;
    pairNumber = -1;
    for j=2:length(numbers)
        if ~thereis1
            if numbers(j-1) == numbers(j)
                pairNumber = numbers(j);
                thereis1 = true;
            end
        else
             if numbers(j-1) == numbers(j) && numbers(j) ~= pairNumber
                thereis = true;
             end
        end
    end
    
    if thereis
        break;
    end
    
    
end

newPassword