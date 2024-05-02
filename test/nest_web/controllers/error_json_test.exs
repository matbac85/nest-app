defmodule NestWeb.ErrorJSONTest do
  use NestWeb.ConnCase, async: true

  test "renders 404" do
    assert NestWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert NestWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
