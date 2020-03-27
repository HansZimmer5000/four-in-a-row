defmodule Check do

    def check_horizontal([]) do
        false
    end
    
    def check_horizontal([row | rest_rows]) do
        if (length row) >= 4 do
            result = _check_horizontal(row)
            if result do
                result
            else
                check_horizontal(rest_rows)
            end
        else 
            false
        end
    end

    def _check_horizontal(list) when (length list) < 4 do
        false
    end

    def _check_horizontal([ row_head | row_rest ]) do
        if row_head != "-" and 
            row_head == get_elem(row_rest,0) and
            row_head == get_elem(row_rest,1) and
            row_head == get_elem(row_rest,2) do
            true
        else 
            _check_horizontal(row_rest)
        end
    end

    def get_elem([head | _ ], 0) do
        head
    end

    def get_elem([_ | rest], index) when index > 0 do
        get_elem(rest, index-1)
    end

end