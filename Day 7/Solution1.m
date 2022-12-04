clear; clc;
%% парсинг
fid = fopen('input.txt');
data = cell(339,4);
i=0;
definedVariables = 0;
while 1
    tline = fgetl(fid);
    if ~ischar(tline)
        break;
    end
    
    i = i+1;
    
    indexs1 = find(tline == '-');
    cut = tline(1:indexs1(1)-1);
    indexs2 = find(cut == ' ');
    switch (length(indexs2))
        case 3
           data{i,1} = cut(1:indexs2(1)-1);
           data{i,2} = cut(indexs2(1)+1:indexs2(2)-1);
           data{i,3} = cut(indexs2(2)+1:indexs2(3)-1);
           data{i,4} = tline(indexs1(1)+3:end);
        case 2
           data{i,2} = cut(1:indexs2(1)-1);
           data{i,3} = cut(indexs2(1)+1:indexs2(2)-1);
           data{i,4} = tline(indexs1(1)+3:end);
        case 1
           data{i,3} = cut(1:indexs2(1)-1);
           data{i,4} = tline(indexs1(1)+3:end);
           definedVariables = definedVariables + 1;
    end
        
    % OPER1 ACT OPER2 TO
    
end
fclose(fid);

%% выборка переменных
variables = cell(1);
variables{1,1} = data{1,4};
sizeVar = 1;
for i=1:length(data)
    exist = false;
    for j=1:sizeVar
        if strcmp(variables{j},data{i,4})
            exist = true;
        end
    end
    
    if ~exist
        sizeVar = sizeVar + 1;
        variables{sizeVar,1} = data{i,4};
    end
end

%%
M = containers.Map(variables, int32(zeros(339,1)));
clear cut definedVariables exist fid i indexs1 indexs2 j sizeVar variables tline ans
%%
sum = 213;
while sum > 0
    sum = 0;
    for i=1:length(data)
        if ~isempty(data{i,2})
            switch data{i,2}
                case 'NOT'
                   dif = abs(M(data{i,4}) - bitcmp(M(data{i,3})));
                   M(data{i,4}) = bitcmp(M(data{i,3}));
                case 'OR'
                   dif = abs(M(data{i,4}) - bitor(M(data{i,1}),M(data{i,3})));
                   M(data{i,4}) = bitor(M(data{i,1}),M(data{i,3}));
                case 'AND'
                   if isempty(str2num(data{i,1}))
                        oper = M(data{i,1});
                   else
                        oper = str2num(data{i,1});
                   end
                   dif = abs(M(data{i,4}) - bitand(oper,M(data{i,3})));
                   M(data{i,4}) = bitand(oper,M(data{i,3}));
                case 'RSHIFT'
                   dif = abs(M(data{i,4}) - bitsra(M(data{i,1}),str2num(data{i,3})));
                   M(data{i,4}) = bitsra(M(data{i,1}),str2num(data{i,3}));
                case 'LSHIFT'
                   dif = abs(M(data{i,4}) - bitshift(M(data{i,1}),str2num(data{i,3})));
                   M(data{i,4}) = bitshift(M(data{i,1}),str2num(data{i,3}));  
            end
        else
           if isempty(str2num(data{i,3}))
                oper = M(data{i,3});
           else
                oper = str2num(data{i,3});
           end
            M(data{i,4}) = oper;
        end
        sum = sum + dif;
    end
end

M('a')