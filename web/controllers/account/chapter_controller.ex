defmodule Twist.Account.ChapterController do
  use Twist.Web, :controller
  alias Twist.Book

  def show(conn, params) do
    query = from book in Book,
      where: book.account_id == ^current_account(conn).id and
        book.permalink == ^params["book_permalink"]
    book = Repo.one(query)

    query = from chapter in assoc(book, :chapters),
      where: chapter.permalink == ^params["permalink"]
    chapter = Repo.one(query)

    elements_query = from(element in assoc(chapter, :elements),
      order_by: [asc: :id])
    elements = elements_query |> Repo.all |> Repo.preload(:notes)

    headings = from(element in elements_query,
      where: element.tag == "h2" or element.tag == "h3")
    |> Repo.all

    render conn, "show.html", book: book, chapter: chapter, elements: elements, headings: headings
  end
end
