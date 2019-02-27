defmodule BetaBabies.Repo.Migrations.CreateBaby do
  use Ecto.Migration

  def change do
    create table(:baby) do
      add :name, :string
      add :parent_name, :string
      add :due_date, :date

      timestamps()
    end

    create unique_index(:baby, [:name])
  end
end
