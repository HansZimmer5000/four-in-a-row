defmodule Field do

    def get_empty_token do
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