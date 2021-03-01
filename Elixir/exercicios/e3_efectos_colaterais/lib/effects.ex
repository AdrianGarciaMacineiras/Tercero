defmodule Effects do

    def print(enteiro) when enteiro >= 0 do
        if enteiro == 0 do
            nil
        else
            print(enteiro-1)
            IO.puts(enteiro)
        end
    end

    def even_print(enteiro) when enteiro >= 0 do
        if enteiro == 0 do
            nil
        else
            even_print(enteiro-1)
            if rem(enteiro,2) == 0 do
                IO.puts(enteiro)
            end
        end
    end

end
