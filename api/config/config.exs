# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sling,
  ecto_repos: [Sling.Repo]

# Configures the endpoint
config :sling, Sling.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nI9a//LKfOHloWFYKKljnoD1C/Nos9UkJK5kXNd+B8sbi0NMgqPhmaI1fv72fhJj",
  render_errors: [view: Sling.ErrorView, accepts: ~w(json)],
  pubsub: [name: Sling.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :guardian, Guardian,
  issuer: "Sling",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Sling.GuardianSerializer,
  secret_key: "LhK5W//MYIwAHEsHpLmj/AWi1Mp2thQMsAZrpcticnmdr9z989R6YwXqbNGVdTkm"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
