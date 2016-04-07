defmodule Twist.LayoutView do
  use Twist.Web, :view

  def current_account(conn) do
    conn.assigns[:current_account]
  end

  def account_root(conn) do
    "http://ryanbigg.lvh.me:4000/"
  end
end
