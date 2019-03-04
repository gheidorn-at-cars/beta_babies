defmodule BetaBabies.Repo.Migrations.CreateBabies do
  use Ecto.Migration

  def change do
    create table(:babies) do
      add :name, :string
      add :parent_name, :string
      add :due_date, :date

      timestamps()
    end

  end
end
