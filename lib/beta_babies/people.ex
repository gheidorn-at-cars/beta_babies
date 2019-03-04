defmodule BetaBabies.People do
  @moduledoc """
  The People context.
  """

  import Ecto.Query, warn: false
  alias BetaBabies.Repo

  alias BetaBabies.People.Baby

  @doc """
  Returns the list of babies.

  ## Examples

      iex> list_babies()
      [%Baby{}, ...]

  """
  def list_babies do
    Repo.all(Baby)
  end

  @doc """
  Gets a single baby.

  Raises `Ecto.NoResultsError` if the Baby does not exist.

  ## Examples

      iex> get_baby!(123)
      %Baby{}

      iex> get_baby!(456)
      ** (Ecto.NoResultsError)

  """
  def get_baby!(id), do: Repo.get!(Baby, id)

  @doc """
  Creates a baby.

  ## Examples

      iex> create_baby(%{field: value})
      {:ok, %Baby{}}

      iex> create_baby(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_baby(attrs \\ %{}) do
    %Baby{}
    |> Baby.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a baby.

  ## Examples

      iex> update_baby(baby, %{field: new_value})
      {:ok, %Baby{}}

      iex> update_baby(baby, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_baby(%Baby{} = baby, attrs) do
    baby
    |> Baby.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Baby.

  ## Examples

      iex> delete_baby(baby)
      {:ok, %Baby{}}

      iex> delete_baby(baby)
      {:error, %Ecto.Changeset{}}

  """
  def delete_baby(%Baby{} = baby) do
    Repo.delete(baby)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking baby changes.

  ## Examples

      iex> change_baby(baby)
      %Ecto.Changeset{source: %Baby{}}

  """
  def change_baby(%Baby{} = baby) do
    Baby.changeset(baby, %{})
  end
end
