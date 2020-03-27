Code.compile_file("./check.ex")

defmodule CheckTests do
    use ExUnit.Case

    test "check_horizontal" do
        assert Check.check_horizontal([["A","A","A","A"], ["-","B","A","-"]]) == true

        assert Check.check_horizontal([["A","-","A","A"], ["-","B","A","-"]]) == false
    end
end