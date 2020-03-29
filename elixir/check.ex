defmodule Check do

    def check_win(rows) do
        check_horizontal(rows) || check_vertical(rows) || check_incline(rows) || check_decline(rows)
    end

    ###

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

    def check_incline(rows) when (length rows) < 4 do
        false
    end

    def check_incline([row_1,row_2,row_3,row_4 | rest_rows]) do
        # Traverse columns to rows

        # use check_horizontal
        if _check_incline(row_1,row_2,row_3,row_4) do
            true
        else
            check_incline([row_2,row_3,row_4|rest_rows])
        end
    end

    def check_decline(rows) when (length rows) < 4 do
        false
    end

    def check_decline([row_1,row_2,row_3,row_4 | rest_rows]) do
        # Traverse columns to rows

        # use check_horizontal
        if _check_decline(row_1,row_2,row_3,row_4) do
            true
        else
            check_decline([row_2,row_3,row_4|rest_rows])
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


    def _check_incline([elem | _], [_, elem | _], [_,_,elem | _], [_,_,_,elem | _]) when elem != "-" do
        true
    end

    def _check_incline([_ | rest_1], [_ | rest_2], [_ | rest_3], [_ | rest_4]) do
        _check_incline(rest_1, rest_2, rest_3, rest_4)
    end

    def _check_incline(_,_,_,_) do
        false
    end


    def _check_decline([_,_,_,elem | _], [_,_,elem | _], [_,elem | _], [elem | _]) when elem != "-" do
        true
    end

    def _check_decline([_ | rest_1], [_ | rest_2], [_ | rest_3], [_ | rest_4]) do
        _check_decline(rest_1, rest_2, rest_3, rest_4)
    end

    def _check_decline(_,_,_,_) do
        false
    end

end