defmodule Ohio.Repo do
  use Ecto.Repo,
    otp_app: :ohio,
    adapter: Ecto.Adapters.Postgres
end
