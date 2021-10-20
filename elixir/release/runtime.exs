import Config

config :my_app, MyApp.Repo,
  ssl: true,
  url: System.fetch_env!("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE", "10"))

config :my_app, MyAppWeb.Endpoint,
  server: true,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: System.fetch_env!("HOST_URL"), port: 443],
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE")

config :my_app,
  ecto_repos: [MyApp.Repo],
  http_adapter: HTTPoison
