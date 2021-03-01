defmodule Boolean do

    def b_not(boolean) do
        do_b_not(boolean)
    end

    defp do_b_not(true) do
        false
    end

    defp do_b_not(false) do
        true
    end

    def b_and(boolean1,boolean2) do
        do_b_and(boolean1, boolean2)
    end

    defp do_b_and(true,true) do
        true
    end

    defp do_b_and(true,false) do
        false
    end

    defp do_b_and(false,true) do
        false
    end

    defp do_b_and(false, false) do
        false
    end

    def b_or(boolean1,boolean2) do
        do_b_or(boolean1,boolean2)
    end

    defp do_b_or(true, true) do
        true
    end

    defp do_b_or(true,false) do
        true
    end

    defp do_b_or(false,true) do
        true
    end

    defp do_b_or(false,false) do
        false
    end
end
