defmodule Twist.Plugs.CurrentAccount do
  import Plug.Conn
  import Ecto.Query, only: [from: 1, from: 2]

  def init(default), do: default

  def call(conn, default) do
    account = case conn.private[:subdomain] do
      nil ->
        nil
      subdomain ->
        query = from account in Twist.Account,
          where: account.subdomain == ^subdomain
        Twist.Repo.one(query)
    end

    assign(conn, :current_account, account)
  end
end
