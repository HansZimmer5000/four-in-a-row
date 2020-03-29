defmodule Field do

    def get_empty_token() do
        "-"
    end

    def init_field(width, height) when width >= 4 and height >= 4 do
        template_row = _init_row(width, [])
        field = _init_field(height, template_row, [])
        {field, {width,height}}
    end

    def init_field(width,height) do
        "Width and Height must be at least 4 but was: #{width}x#{height}"
    end

    def to_string({field, _}) do
        _to_string(field, "")
    end

    def _to_string([], text) do
        text
    end

    def _to_string([row | rest_rows], "") do
        row_text = _to_string_row(row, "")
        _to_string(rest_rows, "#{row_text}")
    end

    def _to_string([row | rest_rows], text) do
        row_text = _to_string_row(row, "")
        _to_string(rest_rows, "#{row_text}\n#{text}")
    end

    def _to_string_row([],text) do
        text
    end

    def _to_string_row([elem | rest], "") do
        _to_string_row(rest, "#{elem}")
    end

    def _to_string_row([elem | rest], text) do
        _to_string_row(rest, "#{text} #{elem}")
    end

    ##################
    # HELPER FUNCTIONS
    ##################

    def _init_row(0, row) do
        row
    end

    def _init_row(width_rest, row) do
        new_row = row ++ [get_empty_token()]
        _init_row(width_rest-1, new_row)
    end

    def _init_field(0, _, field) do
        field
    end

    def _init_field(height_rest, template_row, field) do
        new_field = [template_row | field]
        _init_field(height_rest-1, template_row, new_field)
    end
end