defmodule Sorting do

  def  quicksort(list) do
    do_quicksort(list)
  end

  defp  do_quicksort([]) do
    []
  end

  defp  do_quicksort([pivote|tail]) do
    menores = for x<-tail, x <= pivote, do: x
    mayores = for x<-tail, x > pivote, do: x
    quicksort(menores) ++ [pivote] ++ quicksort(mayores)
  end

  def mergesort(list) do
    do_mergesort(list)
  end

  defp  do_mergesort([]) do
    []
  end

  defp  do_mergesort([element]) do
    [element]
  end

  defp  do_mergesort(list) do
    {izq,dcha} = Enum.split(list, div(length(list),2))
    do_merge(do_mergesort(izq), do_mergesort(dcha),[])
  end

  defp  do_merge([], [], acc) do
    acc
  end

  defp  do_merge([],list,acc) do
    acc ++ list
  end

  defp  do_merge(list,[],acc) do
    acc ++ list
  end

  defp  do_merge([head1|tail1],[head2|tail2],acc) do
    if head1 >= head2 do
      do_merge([head1|tail1], tail2, acc ++ [head2])
    else
      do_merge(tail1, [head2|tail2], acc ++ [head1])
    end
  end

end
