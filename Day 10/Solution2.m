clear; clc;
number = '1113222113';
newNumber = '';
sizeOfNewNumber = 1;
for k=1:50
    k
    count = 1;
    for j = 2:length(number);
        if strcmp(number(j),number(j-1))
            count = count + 1;
        else
            newNumber(sizeOfNewNumber) = num2str(count);
            sizeOfNewNumber = sizeOfNewNumber + 1;
            newNumber(sizeOfNewNumber) = number(j-1);
            sizeOfNewNumber = sizeOfNewNumber + 1;
            count = 1;
        end
    end
    
    newNumber(sizeOfNewNumber) = num2str(count);
    sizeOfNewNumber = sizeOfNewNumber + 1;
    newNumber(sizeOfNewNumber) = number(j);
    count = 1;
    
    number = newNumber;
    newNumber = '';
    sizeOfNewNumber = 1;
            
end

length(number)