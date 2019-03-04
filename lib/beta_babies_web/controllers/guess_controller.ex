defmodule BetaBabiesWeb.GuessController do
  use BetaBabiesWeb, :controller

  alias BetaBabies.People
  alias BetaBabies.Game
  alias BetaBabies.Game.Guess

  @spec index(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html", guesses: Game.list_guesses())
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", guess: Game.get_guess!(id))
  end

  def new(conn, %{"baby_id" => baby_id} = params) do
    # decision point -
    #   1) simply pass through data to display
    #   2) attach a list of all babies and make that a dropdown

    changeset = Guess.changeset(%Guess{}, params)

    render(conn, "new.html", changeset: changeset, target_baby: People.get_baby!(baby_id))
  end

  def create(conn, %{"guess" => params}) do
    case Game.create_guess(params) do
      {:ok, guess} ->
        conn
        |> put_flash(:info, "#{guess.guesser} guesses #{guess.birth_date}!")
        |> redirect(to: Routes.guess_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
