defmodule BetaBabies.Game.Guess do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guesses" do
    field :birth_date, :date
    field :gender, :string
    field :guesser, :string
    field :baby_id, :id

    timestamps()
  end

  @doc false
  def changeset(guess, attrs) do
    guess
    |> cast(attrs, [:guesser, :gender, :birth_date, :baby_id])
    |> validate_required([:guesser, :gender, :birth_date, :baby_id])
  end
end
