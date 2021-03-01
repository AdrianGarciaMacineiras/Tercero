defmodule Manipulating do

    def filter(list,enteiro) do
        do_filter(list,enteiro)
    end

    defp do_filter([head | tail] = list,enteiro) do
        if list == [] do
            []
        else
            if head <= enteiro do
                [head | filter(tail,enteiro)]
            else
                filter(tail,enteiro)
            end
        end
    end

    defp do_filter([],enteiro) do
        []
    end

    def reverse(list) do
        do_reverse(list,[])
    end

    defp do_reverse([],list) do
        list
    end

    defp do_reverse([head|tail], list) do
        do_reverse(tail, [head|list])
    end


    def concatenate(list) do
        do_concatenate(list,[])
    end

    defp do_concatenate([],[]) do
		[]
	end

	defp do_concatenate([],l) do
		reverse(l)
	end

	defp do_concatenate([h|t],l) do
		do_concatenate(t,concatenateAux(h,l))
	end

	defp concatenateAux([h|t],l) do
		concatenateAux(t,[h|l])
	end

	defp concatenateAux([],l) do
		l
	end

    def flatten(list) do
        do_flatten(list,[])
    end

    defp  do_flatten([head|tail],list) do
        do_flatten(head,do_flatten(tail,list))
    end

    defp  do_flatten([],list) do
        list
    end

    defp  do_flatten(element,list) do
        [element | list]
    end
end
