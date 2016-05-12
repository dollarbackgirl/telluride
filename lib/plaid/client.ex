defmodule Plaid.Client do
  use HTTPoison.Base

  @api_host "https://tartan.plaid.com" # TODO come from config

  def process_url(url) do
    @api_host <> url
  end
end
