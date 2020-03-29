Code.compile_file("./field.ex")

defmodule FieldTests do
    use ExUnit.Case

    test "init" do
        assert Field.init(5,4) == {[["-","-","-","-"],["-","-","-","-"],["-","-","-","-"],["-","-","-","-"],["-","-","-","-"]], {5,4}}

        assert Field.init(3,4) == "Width and Height must be at least 4 but was: 3x4"

        assert Field.init(4,3) == "Width and Height must be at least 4 but was: 4x3"
    end

    test "puts" do
        assert Field.to_string({[["a", "b"], ["-","c"]], {4,4}}) == "b c\na -"

        assert Field.to_string({[["00","10","20","30"],["01","11","21","31"],["02","12","22","32"],["03","13","23","33"]], {4,4}}) == "30 31 32 33\n20 21 22 23\n10 11 12 13\n00 01 02 03"
    end

    test "insert_token" do
        field_1 = {[["-","-","02","03"],["-","-","12","13"],["-","-","22","23"],["-","-","32","33"]], {4,4}}
        assert Field.insert_token(field_1, 3, "A") == {[["-","-","02","03"],["-","-","12","13"],["A","-","22","23"],["-","-","32","33"]], {4,4}}

        field_2 = {[["00","01","02","03"],["10","11","12","13"],["20","21","22","23"],["30","31","32","33"]], {4,4}}
        assert Field.insert_token(field_2, 3, "A") == field_2
    end
end