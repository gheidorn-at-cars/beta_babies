defmodule BetaBabies.People.Baby do
  use Ecto.Schema
  import Ecto.Changeset


  schema "babies" do
    field :due_date, :date
    field :name, :string
    field :parent_name, :string

    timestamps()
  end

  @doc false
  def changeset(baby, attrs) do
    baby
    |> cast(attrs, [:name, :parent_name, :due_date])
    |> validate_required([:name, :parent_name, :due_date])
  end
end
