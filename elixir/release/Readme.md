## Elixir Release
This one contains resources related to the deployment of Elixir apps using releases. It's a very basic approach but should be good as a start point.

### Contents
- `Dockerfile` - multi-stage Dockerfile that produces super light image (app stage based on Alpine linux)
- `config.exs` - config read on at build time
- `runtime.exs` - runtime config
- `release.ex` - to run custom commands in production (e.g. migrations)

### Tips
- functions defined in `release.ex` can be invoked via `eval` or `rpc` commands (e.g. `./bin/my_app rpc MyApp.Release.migrate`)
- use runtime config to configure app via environment variables
- use `System.fetch_env!` in runtime config to fail fast when some ENVs are missing

### Additional resources
- https://elixir-lang.org/getting-started/mix-otp/config-and-releases.html
- https://hexdocs.pm/mix/1.12/Mix.Tasks.Release.html
- https://hexdocs.pm/phoenix/releases.html