defmodule Plaid.Client do
  use HTTPoison.Base

  @api_host "https://tartan.plaid.com" # TODO come from config
  @expected_fields ~w(transactions)

  def process_url(url) do
    @api_host <> url
  end

  def process_response_body(body) do
    Poison.decode(body, as: %{"transactions" => [%Plaid.Types.Transaction{}]})
  end

end
