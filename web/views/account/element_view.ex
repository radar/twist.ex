defmodule Twist.Account.ElementView do
  use Twist.Web, :view

  def render("element", %{ element: element = %{ tag: tag }}) do
    render "_element.html", element: element
    # raise "Twist.Account.ElementView does not know how to render #{tag}"
  end
end
