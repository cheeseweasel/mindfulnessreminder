# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mindfulnessreminder,
  ecto_repos: [Mindfulnessreminder.Repo]

# Configures the endpoint
config :mindfulnessreminder, MindfulnessreminderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8teuWRWkDb1hfjCAuz4+8H9S98g0tbDOBxj32EALfHTj7VhiRRsTgmUAtqWMkZTp",
  render_errors: [view: MindfulnessreminderWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mindfulnessreminder.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
