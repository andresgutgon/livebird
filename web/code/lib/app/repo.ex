

defmodule App.Repo do
  use Ecto.Repo, otp_app: :app, adapter: Ecto.Adapters.Postgres

  def init(_, config) do
    config = config
     |> Keyword.put(:username, System.get_env("PGUSER"))
     |> Keyword.put(:password, System.get_env("PGPASSWORD"))
     |> Keyword.put(:hostname, System.get_env("PGHOST"))
     |> Keyword.put(:port, System.get_env("PGPORT") |> String.to_integer)

    {:ok, config}
  end
end
