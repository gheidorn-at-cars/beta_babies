defmodule BetaBabies.Repo.Migrations.CreateGuesses do
  use Ecto.Migration

  def change do
    create table(:guesses) do
      add :guesser, :string
      add :gender, :string
      add :birth_date, :date
      add :baby_id, references(:babies, on_delete: :nothing)

      timestamps()
    end

    create index(:guesses, [:baby_id])
  end
end
