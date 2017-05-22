defmodule Ohio.ResolutionController do
  use Ohio.Web, :controller

  alias Ohio.Resolution

  def index(conn, _params) do
    resolutions = Repo.all(Resolution)
    render(conn, "index.html", resolutions: resolutions)
  end

  def new(conn, _params) do
    changeset = Resolution.changeset(%Resolution{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"resolution" => resolution_params}) do
    changeset = Resolution.changeset(%Resolution{}, resolution_params)

    case Repo.insert(changeset) do
      {:ok, _resolution} ->
        conn
        |> put_flash(:info, "Resolution created successfully.")
        |> redirect(to: resolution_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resolution = Repo.get!(Resolution, id)
    render(conn, "show.html", resolution: resolution)
  end

  def edit(conn, %{"id" => id}) do
    resolution = Repo.get!(Resolution, id)
    changeset = Resolution.changeset(resolution)
    render(conn, "edit.html", resolution: resolution, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resolution" => resolution_params}) do
    resolution = Repo.get!(Resolution, id)
    changeset = Resolution.changeset(resolution, resolution_params)

    case Repo.update(changeset) do
      {:ok, resolution} ->
        conn
        |> put_flash(:info, "Resolution updated successfully.")
        |> redirect(to: resolution_path(conn, :show, resolution))
      {:error, changeset} ->
        render(conn, "edit.html", resolution: resolution, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resolution = Repo.get!(Resolution, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(resolution)

    conn
    |> put_flash(:info, "Resolution deleted successfully.")
    |> redirect(to: resolution_path(conn, :index))
  end
end
