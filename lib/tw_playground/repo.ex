defmodule TwPlayground.Repo do
  use Ecto.Repo,
    otp_app: :tw_playground,
    adapter: Ecto.Adapters.Postgres
end
