# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :homework,
  ecto_repos: [Homework.Repo]

# Configures the endpoint
config :homework, HomeworkWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J6/s1sfaxkK4gNSdTCTRt+ymZQD4qPUq80kZ57GVk19PkhthpGZXySXbaFiDAS5y",
  render_errors: [view: HomeworkWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Homework.PubSub,
  live_view: [signing_salt: "guzNYxS1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
