defmodule Twist.Account.ElementView do
  use Twist.Web, :view

  def render("element", %{ element: element = %{ tag: "footnote" }}) do
    content = Quinn.parse(element.content)
     [%{attr: [name: name, href: "#"]}] = Quinn.find(content, :a)
     render "_footnote.html", element: element, name: name
  end

  def render("element", %{ element: element = %{ tag: tag }}) do
    render "_element.html", element: element
  end
end
