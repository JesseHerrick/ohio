defmodule Ohio.ResolutionControllerTest do
  use Ohio.ConnCase

  alias Ohio.Resolution
  @valid_attrs %{api_link: "some content", apn: "some content", chamber: "some content", concurrence: "some content", effective_date: "some content", effective_date_notes: "some content", formatted_ver: "some content", govsigned: "some content", html_download_link: "some content", long_title: "some content", name: "some content", number: "some content", pdf_download_link: "some content", revno: 42, short_title: "some content", trackingno: "some content", type: "some content", version: "some content", version_id: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, resolution_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing resolutions"
  end
end
