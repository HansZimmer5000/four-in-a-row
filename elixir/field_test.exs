Code.compile_file("./field.ex")

defmodule FieldTests do
    use ExUnit.Case

    test "init" do
        assert Field.init(4,5) == {[["-","-","-","-"],["-","-","-","-"],["-","-","-","-"],["-","-","-","-"],["-","-","-","-"]], {4,5}}

        assert Field.init(3,4) == "Width and Height must be at least 4 but was: 3x4"

        assert Field.init(4,3) == "Width and Height must be at least 4 but was: 4x3"
    end

    test "puts" do
        assert Field.to_string({[["00","01","02","03"],["10","11","12","13"],["20","21","22","23"],["30","31","32","33"]], {4,4}}) == "30 31 32 33\n20 21 22 23\n10 11 12 13\n00 01 02 03"

        assert Field.to_string({[["a", "b"], ["-","c"]], {4,4}}) == "- c\na b"
    end
end