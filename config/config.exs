# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :twist, Twist.Endpoint,
  url: [host: "lvh.me"],
  root: Path.dirname(__DIR__),
  secret_key_base: "qBY724uMAG/tjiX1K2pKvgjZos2x/i/ipYdT6CYVi4Dh+uiyLNA+6uuT1SbRe2UM",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Twist.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
