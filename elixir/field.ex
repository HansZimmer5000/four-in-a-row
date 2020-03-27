defmodule Field do

  def init_field(width, height) when width >= 4 and height >= 4 do
    field = _init_field(width, height, [])
    {field, {width,height}}
  end

  def init_field(width,height) do
    "Width and Height must be at least 4 but was: #{width}x#{height}"
  end

  def _init_field(width_rest, height_rest, field) do
    
  end
end