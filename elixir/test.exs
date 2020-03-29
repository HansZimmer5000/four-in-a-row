ExUnit.start()

#StyleGuide: https://github.com/christopheradams/elixir_style_guide
# TestingGuide: https://softwareengineering.stackexchange.com/questions/7823/is-it-ok-to-have-multiple-asserts-in-a-single-unit-test

Code.require_file "field_test.exs"
Code.require_file "check_test.exs"

Code.compile_file("game.ex")
defmodule GameTests do
    use ExUnit.Case

    test "get_input" do
        IO.puts("Insert 1 next:")
        assert Game.get_input() == "1"
    end
end