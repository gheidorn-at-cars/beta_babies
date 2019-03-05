defmodule BetaBabies.PeopleTest do
  use BetaBabies.DataCase

  alias BetaBabies.People

  describe "babies" do
    alias BetaBabies.People.Baby

    @valid_attrs %{due_date: ~D[2010-04-17], name: "some name", parent_name: "some parent_name"}
    @update_attrs %{
      due_date: ~D[2011-05-18],
      name: "some updated name",
      parent_name: "some updated parent_name"
    }
    @invalid_attrs %{due_date: nil, name: nil, parent_name: nil}

    def baby_fixture(attrs \\ %{}) do
      {:ok, baby} =
        attrs
        |> Enum.into(@valid_attrs)
        |> People.create_baby()

      baby
    end

    test "list_babies/0 returns all babies" do
      baby = baby_fixture()
      assert People.list_babies() == [baby]
    end

    test "get_baby!/1 returns the baby with given id" do
      baby = baby_fixture()
      assert People.get_baby!(baby.id) == baby
    end

    test "create_baby/1 with valid data creates a baby" do
      assert {:ok, %Baby{} = baby} = People.create_baby(@valid_attrs)
      assert baby.due_date == ~D[2010-04-17]
      assert baby.name == "some name"
      assert baby.parent_name == "some parent_name"
    end

    test "create_baby/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_baby(@invalid_attrs)
    end

    test "update_baby/2 with valid data updates the baby" do
      baby = baby_fixture()
      assert {:ok, %Baby{} = baby} = People.update_baby(baby, @update_attrs)
      assert baby.due_date == ~D[2011-05-18]
      assert baby.name == "some updated name"
      assert baby.parent_name == "some updated parent_name"
    end

    test "update_baby/2 with invalid data returns error changeset" do
      baby = baby_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_baby(baby, @invalid_attrs)
      assert baby == People.get_baby!(baby.id)
    end

    test "delete_baby/1 deletes the baby" do
      baby = baby_fixture()
      assert {:ok, %Baby{}} = People.delete_baby(baby)
      assert_raise Ecto.NoResultsError, fn -> People.get_baby!(baby.id) end
    end

    test "change_baby/1 returns a baby changeset" do
      baby = baby_fixture()
      assert %Ecto.Changeset{} = People.change_baby(baby)
    end
  end
end
