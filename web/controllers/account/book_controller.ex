defmodule Twist.Account.BookController do
  use Twist.Web, :controller
  alias Twist.Repo
  alias Twist.Book

  def index(conn, _params) do
    account = current_account(conn)
    account_id = account.id
    query = from book in Book,
      where: book.account_id == ^account.id
    books = query |> Repo.all
    render conn, "index.html", books: books
  end
end
