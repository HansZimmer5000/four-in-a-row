Code.compile_file("field.ex")

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
    field=Field.init_field(7,6)
    game_round(field)
  end

  def game_round(_field) do
    #print_field
    #get_input
    #insert_token
    #check_win
    #game_round
  end

  def get_input() do
    input = IO.gets("Insert Number between 1 and 7: ")
    String.replace(input, "\n", "")
  end
end