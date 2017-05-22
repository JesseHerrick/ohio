defmodule Ohio.ResolutionControllerTest do
  use Ohio.ConnCase

  alias Ohio.Resolution
  @valid_attrs %{api_link: "some content", apn: "some content", chamber: "some content", concurrence: "some content", effective_date: "some content", effective_date_notes: "some content", formatted_ver: "some content", govsigned: "some content", html_download_link: "some content", long_title: "some content", name: "some content", number: "some content", pdf_download_link: "some content", revno: 42, short_title: "some content", trackingno: "some content", type: "some content", version: "some content", version_id: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, resolution_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing resolutions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, resolution_path(conn, :new)
    assert html_response(conn, 200) =~ "New resolution"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, resolution_path(conn, :create), resolution: @valid_attrs
    assert redirected_to(conn) == resolution_path(conn, :index)
    assert Repo.get_by(Resolution, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, resolution_path(conn, :create), resolution: @invalid_attrs
    assert html_response(conn, 200) =~ "New resolution"
  end

  test "shows chosen resource", %{conn: conn} do
    resolution = Repo.insert! %Resolution{}
    conn = get conn, resolution_path(conn, :show, resolution)
    assert html_response(conn, 200) =~ "Show resolution"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, resolution_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    resolution = Repo.insert! %Resolution{}
    conn = get conn, resolution_path(conn, :edit, resolution)
    assert html_response(conn, 200) =~ "Edit resolution"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    resolution = Repo.insert! %Resolution{}
    conn = put conn, resolution_path(conn, :update, resolution), resolution: @valid_attrs
    assert redirected_to(conn) == resolution_path(conn, :show, resolution)
    assert Repo.get_by(Resolution, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    resolution = Repo.insert! %Resolution{}
    conn = put conn, resolution_path(conn, :update, resolution), resolution: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit resolution"
  end

  test "deletes chosen resource", %{conn: conn} do
    resolution = Repo.insert! %Resolution{}
    conn = delete conn, resolution_path(conn, :delete, resolution)
    assert redirected_to(conn) == resolution_path(conn, :index)
    refute Repo.get(Resolution, resolution.id)
  end
end
