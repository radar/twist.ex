defmodule Twist.Account.BookController do
  use Twist.Web, :controller
  alias Twist.Repo
  alias Twist.Book

  def index(conn, _params) do
    query = from book in Book,
      where: book.account_id == ^current_account(conn).id
    books = query |> Repo.all
    render conn, "index.html", books: books
  end

  def show(conn, params) do
    book = Repo.get_by!(Book, permalink: params["permalink"])
      |> Repo.preload(:chapters)
    render conn, "show.html", book: book, chapters: book.chapters
  end
end
