function [numberNew, excess] = incrementAndBound(number)
    lowerLimit = 97;
    upperLimit = 122;

    numberNew = number + 1;
    excess = false;
    if numberNew > upperLimit
        numberNew = lowerLimit;
        excess = true;
    end
end