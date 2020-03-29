defmodule Check do

    def check_win(rows) do
        check_horizontal(rows) || check_vertical(rows) || check_diagonal(rows, :incline) || check_diagonal(rows, :diagonal)
    end

    ### TODO Refactor following code

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

    def check_vertical(rows) when (length rows) < 4 do
        false
    end

    def check_vertical([row_1,row_2,row_3,row_4 | rest_rows]) do
        # Traverse columns to rows

        # use check_horizontal
        if _check_vertical(row_1,row_2,row_3,row_4) do
            true
        else
            check_vertical([row_2,row_3,row_4|rest_rows])
        end
    end

    def check_diagonal(rows,_) when (length rows) < 4 do
        false
    end

    def check_diagonal([row_1,row_2,row_3,row_4 | rest_rows], diagonal) do
        # Traverse columns to rows

        # use check_horizontal
        if _check_diagonal(row_1,row_2,row_3,row_4, diagonal) do
            true
        else
            check_diagonal([row_2,row_3,row_4|rest_rows], diagonal)
        end
    end

    ##################
    # HELPER FUNCTIONS
    ##################

    def _check_horizontal([ elem, elem, elem, elem | _row_rest ]) when elem != "-" do
        true
    end

    def _check_horizontal([ _ | row_rest]) when (length row_rest) >= 4 do
        _check_horizontal(row_rest)
    end

    def _check_horizontal(_) do
        false
    end


    def _check_vertical([],[],[],[]) do
        false
    end
    
    def _check_vertical([elem | _], [elem | _], [elem | _], [elem | _]) when elem != "-" do
        true
    end

    def _check_vertical([_ | rest_1], [_ | rest_2], [_ | rest_3], [_ | rest_4]) do
        _check_vertical(rest_1, rest_2, rest_3, rest_4)
    end


    def _check_diagonal([elem | _], [_, elem | _], [_,_,elem | _], [_,_,_,elem | _], :incline) when elem != "-" do
        true
    end

    def _check_diagonal([_,_,_,elem | _], [_,_,elem | _], [_,elem | _], [elem | _], :decline) when elem != "-" do
        true
    end

    def _check_diagonal([_ | rest_1], [_ | rest_2], [_ | rest_3], [_ | rest_4], diagonal) do
        _check_diagonal(rest_1, rest_2, rest_3, rest_4, diagonal)
    end

    def _check_diagonal(_,_,_,_,_) do
        false
    end

end