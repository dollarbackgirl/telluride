defmodule Telluride.Repo do
  use Ecto.Repo, otp_app: :telluride
  use Scrivener, page_size: 10
end
