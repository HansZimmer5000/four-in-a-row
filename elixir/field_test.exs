Code.compile_file("./field.ex")

defmodule FieldTests do
    use ExUnit.Case

    test "init_field" do
        assert Field.init_field(4,5) == {[["-","-","-","-"],["-","-","-","-"],["-","-","-","-"],["-","-","-","-"],["-","-","-","-"]], {4,5}}

        assert Field.init_field(3,4) == "Width and Height must be at least 4 but was: 3x4"

        assert Field.init_field(4,3) == "Width and Height must be at least 4 but was: 4x3"
    end
end