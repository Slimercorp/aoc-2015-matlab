clear; clc;

Ingr = [3 0 0 -3 2;
        -3 3 0 0 9;
        -1 0 4 0 1;
        0 0 -2 2 8];
        
maxScore = 0;
teaSpoons = 101;

i = 1; j = 1; k = 1; m = 1;
stop = false;
while ~stop
    if (i + j + k + m) <= 100
        capacity = max(0, Ingr(1,1) * i + Ingr(2,1) * j + Ingr(3,1) * k + Ingr(4,1) * m);
        durability = max(0, Ingr(1,2) * i + Ingr(2,2) * j + Ingr(3,2) * k + Ingr(4,2) * m);
        flavor = max(0,Ingr(1,3) * i + Ingr(2,3) * j + Ingr(3,3) * k + Ingr(4,3) * m);
        texture = max(0,Ingr(1,4) * i + Ingr(2,4) * j + Ingr(3,4) * k + Ingr(4,4) * m);
        
        score = capacity * durability * flavor * texture;
        
        if score > maxScore
            maxScore = score;
        end
    end
        
    %приращаем
    m = m + 1;

    if m > 97
        m = 1;
        k = k + 1;
    end

     if k > 97
        k = 1;
        j = j + 1;
     end

    if j > 97
        j = 1;
        i = i + 1;
    end
   
    if i == 98
        stop = true;
    end
        
end