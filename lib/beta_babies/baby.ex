defmodule BetaBabies.Baby do
  use Ecto.Schema
  import Ecto.{Changeset, Query}

  alias BetaBabies.{Baby, Repo}

  schema "baby" do
    field :name, :string
    field :parent_name, :string
    field :due_date, :date

    timestamps()
  end

  def changeset(baby, params \\ %{}) do
    cast(baby, params, [:name, :parent_name, :due_date])
  end

  def create(attrs \\ %{}) do
    %Baby{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def find(name) do
    from(b in Baby,
      where: b.name == ^name,
      select: [:name, :parent_name, :due_date]
    )
    |> Repo.one()
  end

  def all() do
    query = from "baby", select: [:name, :parent_name, :due_date]
    Repo.all(query)
  end
end
