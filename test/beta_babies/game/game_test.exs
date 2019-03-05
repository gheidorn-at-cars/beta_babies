defmodule BetaBabies.GameTest do
  use BetaBabies.DataCase

  alias BetaBabies.Game

  describe "guesses" do
    alias BetaBabies.Game.Guess

    @valid_attrs %{birth_date: ~D[2010-04-17], gender: "some gender", guesser: "some guesser"}
    @update_attrs %{
      birth_date: ~D[2011-05-18],
      gender: "some updated gender",
      guesser: "some updated guesser"
    }
    @invalid_attrs %{birth_date: nil, gender: nil, guesser: nil}

    def guess_fixture(attrs \\ %{}) do
      {:ok, guess} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_guess()

      guess
    end

    test "list_guesses/0 returns all guesses" do
      guess = guess_fixture()
      assert Game.list_guesses() == [guess]
    end

    test "get_guess!/1 returns the guess with given id" do
      guess = guess_fixture()
      assert Game.get_guess!(guess.id) == guess
    end

    test "create_guess/1 with valid data creates a guess" do
      assert {:ok, %Guess{} = guess} = Game.create_guess(@valid_attrs)
      assert guess.birth_date == ~D[2010-04-17]
      assert guess.gender == "some gender"
      assert guess.guesser == "some guesser"
    end

    test "create_guess/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_guess(@invalid_attrs)
    end

    test "update_guess/2 with valid data updates the guess" do
      guess = guess_fixture()
      assert {:ok, %Guess{} = guess} = Game.update_guess(guess, @update_attrs)
      assert guess.birth_date == ~D[2011-05-18]
      assert guess.gender == "some updated gender"
      assert guess.guesser == "some updated guesser"
    end

    test "update_guess/2 with invalid data returns error changeset" do
      guess = guess_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_guess(guess, @invalid_attrs)
      assert guess == Game.get_guess!(guess.id)
    end

    test "delete_guess/1 deletes the guess" do
      guess = guess_fixture()
      assert {:ok, %Guess{}} = Game.delete_guess(guess)
      assert_raise Ecto.NoResultsError, fn -> Game.get_guess!(guess.id) end
    end

    test "change_guess/1 returns a guess changeset" do
      guess = guess_fixture()
      assert %Ecto.Changeset{} = Game.change_guess(guess)
    end
  end
end
