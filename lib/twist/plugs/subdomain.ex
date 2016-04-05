defmodule Twist.Plug.Subdomain do

  def init(default), do: default
  def call(conn, router) do
    case get_subdomain(conn.host) do
      subdomain when byte_size(subdomain) > 0 ->
        conn
        |> Plug.Conn.put_private(:subdomain, subdomain)
        |> router.call(router.init({}))
        |> Plug.Conn.halt
      _ -> conn
    end
  end

  defp get_subdomain(host) do
    root_host = Twist.Endpoint.config(:url)[:host]
    String.replace(host, ~r/.?#{root_host}/, "")
  end
end
