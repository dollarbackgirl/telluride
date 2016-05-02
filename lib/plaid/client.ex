defmodule Plaid.Client do
  use HTTPoison.Base

  @api_host "http://https://tartan.plaid.com/"

  def process_url(url) do
    @api_host <> url
  end
end
