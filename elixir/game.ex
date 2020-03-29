Code.compile_file("field.ex")
Code.compile_file("check.ex")

defmodule Game do
  @moduledoc """
  The main Game module.
  """

  @doc """
  Starts the game with a 7x6 field. It returns a tuple consisting of the field, the size and the token of the player that plays the upcoming round.
  ## Examples
      iex> Game.start_game
  """
  def start_game do
    field=Field.init(7,6)
    game_round(field, "A")
  end

  def game_round(field, player_token) do
    Field.to_string(field)
    |> IO.puts()
    input = get_input()
    new_field = Field.insert_token(field, input, player_token)
    if Check.check_win(new_field) do
      IO.puts("Player #{player_token} won the game!")
      Field.to_string(new_field)
      |> IO.puts()
    else
      if player_token == "A" do
        game_round(new_field, "B")
      else 
        game_round(new_field, "A")
      end
    end
  end

  def get_input() do
    {num, _} = (
      IO.gets("Insert Number between 1 and 7: ")
      |> String.replace("\n", "")
      |> Integer.parse()
    )
    num
  end
end

Game.start_game()