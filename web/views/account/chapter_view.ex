defmodule Twist.Account.ChapterView do
  use Twist.Web, :view

  def render("sidebar", %{headings: headings}) do
    headings = Enum.map headings, fn (heading) ->
      class = case heading.tag do
        "h2" ->
          "major"
        "h3" -> "minor"
      end

      tag = Quinn.parse(heading.content) |> List.first
      text = tag.value |> List.first
      link = tag.attr[:id]

      %{
        class: class,
        text: text,
        link: link
      }
    end

    render "_sidebar.html", headings: headings
  end
end
