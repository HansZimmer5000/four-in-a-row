defmodule Check do

    def check_horizontal([]) do
        false
    end
    
    def check_horizontal([row | rest_rows]) do
        result = _check_horizontal(row)
        if result do
            result
        else
            check_horizontal(rest_rows)
        end
    end

    def _check_horizontal([ elem, elem, elem, elem | _row_rest ]) when elem != "-" do
        true
    end

    def _check_horizontal([ _ | row_rest]) when (length row_rest) >= 4 do
        _check_horizontal(row_rest)
    end

    def _check_horizontal(_) do
        false
    end






    def get_elem([head | _ ], 0) do
        head
    end

    def get_elem([_ | rest], index) when index > 0 do
        get_elem(rest, index-1)
    end

end