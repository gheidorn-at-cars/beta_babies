defmodule BetaBabiesWeb.BabyController do
  use BetaBabiesWeb, :controller

  alias BetaBabies.Baby

  @spec index(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html", babies: Baby.all())
  end

  def show(conn, %{"id" => name}) do
    render(conn, "show.html", baby: Baby.find(name))
  end

  def new(conn, _params) do
    changeset = Baby.changeset(%Baby{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"baby" => baby_params}) do
    case Baby.create(baby_params) do
      {:ok, baby} ->
        conn
        |> put_flash(:info, "#{baby.name} created!")
        |> redirect(to: Routes.baby_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
