clear; clc;
load('dataForStage2.mat');

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