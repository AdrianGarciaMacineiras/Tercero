defmodule Db do

  def new() do
    []
  end


  #---------------WRITE---------------
  def write(dbref,key,element) do
    do_write(dbref,key,element)
  end

  defp  do_write(dbref,key,element) do
    [{key,element}|dbref]
  end

  defp  do_write(_,_,_) do
    {:error, :not_found}
  end

#----------------AUX FUNC--------------------
defp reverse(list) do
  do_reverse(list,[])
end

defp do_reverse([],list) do
  list
end

defp do_reverse([head|tail], list) do
  do_reverse(tail, [head|list])
end



defp  join([],list) do
  reverse(list)
end

defp  join([list|[]],slist) do
  join([],[list|slist])
end

defp  join([list|tail],slist) do
  join(tail,[list|slist])
end


#---------------DELETE------------
  def  delete(dbref,key) do
    simple_delete(dbref,key)
  end

  defp  simple_delete([],_) do
    []
  end

  defp  simple_delete([{head,_}|[]],key) when head == key do
    []
  end

  defp  simple_delete([{head,tail}|[]],_) do
    [{head,tail}]
  end

  defp  simple_delete([{head,_}|tail],key) when head == key do
    tail
  end

  defp  simple_delete([{head,tail}|stail],key) do
    do_delete(key,stail,[{head,tail}])
  end

  defp  do_delete(key,[{head,_}|[]],list) when head == key do
    reverse(list)
  end

  defp  do_delete(_,[{head,tail}|[]],list) do
    reverse([{head,tail}|list])
  end

  defp  do_delete(key,[{head,_}|tail],list) when head == key do
    join(tail,list)
  end

  defp  do_delete(key,[{head,tail}|stail],list) do
    do_delete(key,stail,[{head,tail}|list])
  end

  #-----------------READ-------------
  def  read(list,key) do
    do_read(list,key)
  end

  defp  do_read([],_) do
    {:error, :not_found}
  end

  defp  do_read([{head,tail}|[]],key) when head == key do
    {:ok, tail}
  end

  defp  do_read([{_,_}|[]],key) do
    {:error, :not_found}
  end

  defp  do_read([{head,tail}|_],key) when head == key do
    {:ok, tail}
  end

  defp  do_read([{_,_}|tail], key) do
    do_read(tail,key)
  end

  defp  do_read(_,_) do
    {:error, :not_found}
  end


  #-------------------MATCH-----------------------
  def match(dbref, element) do
    simple_match(dbref,element)
  end

  defp  simple_match([],_) do
    []
  end

  defp  simple_match([{head,tail}|[]],element) when tail == element do
    [head]
  end

  defp  simple_match([_|[]],element) do
    []
  end

  defp  simple_match([{head,tail}|stail],element) when tail == element do
    do_match(element,stail,[head])
  end

  defp  simple_match([{_,_}|stail], element) do
    do_match(element,stail,[])
  end

  defp  simple_match(_,_) do
    []
  end

  defp  do_match(_,[],list) do
    list
  end

  defp  do_match(element,[{head,tail}|[]],list) when tail == element do
    [head | list]
  end

  defp  do_match(_,[_|[]],list) do
    list
  end

  defp  do_match(element, [{head,tail}|stail],list) when tail == element do
    do_match(element,stail,[head|list])
  end

  defp  do_match(element,[{_,_}|tail],list) do
    do_match(element,tail,list)
  end

  defp  do_match(_,_,list) do
    list
  end


  #-----------DESTROY----------
  def  destroy(_) do
    []
  end

end
