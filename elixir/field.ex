defmodule Field do

    def get_empty_token() do
        "-"
    end

    def init(width, height) when width >= 4 and height >= 4 do
        template_column = _init_column(height, [])
        field = _init(width, template_column, [])
        {field, {width,height}}
    end

    def init(width,height) do
        "Width and Height must be at least 4 but was: #{width}x#{height}"
    end

    def to_string({field, _}) do
        _to_string(field, "")
    end

    def insert_token({field, _}, column_number, player_token) do
        _insert_token(field, column_number-1, player_token)
    end

    def _insert_token([row | rest_rows], column_index, player_token) do
        "c"
    end

    def _insert_token_column([], akku, _) do
        akku
    end

    def _insert_token_column(["-" | rest_column],akku, player_token) do
        akku ++ [player_token | rest_column]
    end

    def _insert_token_column([token | rest_column], akku, player_token) do
        _insert_token_column(rest_column, akku ++ [token], player_token)
    end

    ##################
    # HELPER FUNCTIONS
    ##################

    def _init_column(0, column) do
        column
    end

    def _init_column(height_rest, column) do
        new_column = column ++ [get_empty_token()]
        _init_column(height_rest-1, new_column)
    end

    def _init(0, _, field) do
        field
    end

    def _init(width_rest, template_column, field) do
        new_field = [template_column | field]
        _init(width_rest-1, template_column, new_field)
    end

    def _to_string([], text) do
        text
    end

    def _to_string(columns, text) do
        {row_text, rest_columns} = _get_first_of_every_list(columns, "", [])
        cond do
            text == "" ->
                _to_string(rest_columns, "#{row_text}")
            row_text == "" ->
                _to_string(rest_columns, "#{text}")
            true ->
                _to_string(rest_columns, "#{row_text}\n#{text}")
        end
    end

    def _get_first_of_every_list([], text, rest_lists) do
        {text, rest_lists}
    end

    def _get_first_of_every_list([[] | _], text, rest_lists) do
        {text, rest_lists}
    end

    def _get_first_of_every_list([[elem | rest_column_1] | rest_columns], text, rest_lists) do
        if text == "" do
            _get_first_of_every_list(rest_columns, "#{elem}", rest_lists ++ [rest_column_1])
        else
            _get_first_of_every_list(rest_columns, "#{text} #{elem}", rest_lists ++ [rest_column_1])
        end
    end

end