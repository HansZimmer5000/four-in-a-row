Code.compile_file("./check.ex")

defmodule CheckTests do
    use ExUnit.Case

    test "check_horizontal" do
        assert Check.check_horizontal([["A","A","A","A"], ["-","B","A","-"]]) == true

        assert Check.check_horizontal([["A","-","A","A"], ["-","B","A","-"]]) == false
    end

    test "check_vertical" do
        assert Check.check_vertical([["-","-"],["-","A"],["-","A"],["-","A"],["-","A"]]) == true

        assert Check.check_vertical([["-","-"],["-","A"],["-","A"],["-","A"]])  == false
    end

    test "check_incline" do
        assert Check.check_diagonal([["A","-","-","-"], ["-","A","-","-"],["-","-","A","-"],["-","-","-","A"]], :incline) == true

        assert Check.check_diagonal([["-","-","-","A"], ["-","-","A","-"],["-","A","-","-"],["A","-","-","-"]], :incline) == false
    end

    test "check_decline" do
        assert Check.check_diagonal([["-","-","-","A"], ["-","-","A","-"],["-","A","-","-"],["A","-","-","-"]], :decline) == true

        assert Check.check_diagonal([["A","-","-","-"], ["-","A","-","-"],["-","-","A","-"],["-","-","-","A"]], :decline) == false
    end
end