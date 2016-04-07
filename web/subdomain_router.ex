defmodule Twist.SubdomainRouter do
  use Twist.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug Twist.Plugs.CurrentAccount
  end

  scope "/", Twist.Account do
    pipe_through :browser # Use the default browser stack

    get "/", BookController, :index
    get "/:permalink", BookController, :show

    scope "/:book_permalink", as: :book do
      get "/:permalink", ChapterController, :show
    end
  end
end
