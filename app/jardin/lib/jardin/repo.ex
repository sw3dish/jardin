defmodule Jardin.Repo do
  use Ecto.Repo,
    otp_app: :jardin,
    adapter: Ecto.Adapters.Postgres
end
