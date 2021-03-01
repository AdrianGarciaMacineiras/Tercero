defmodule Create do
    def reverse_create(enteiro) when enteiro >= 0 do
        if enteiro == 0 do
            []
        else
            [enteiro] ++ reverse_create(enteiro-1)
        end
    end

    def create(enteiro) when enteiro >= 0 do
        if enteiro == 0 do
            []
        else
            create(enteiro-1)++[enteiro]
        end
    end
end
