defmodule Plaid.Api do
  import Plaid.Types.User

  @moduledoc """
  iex(3)> user = %Plaid.User{username: "plaid_test", password: "plaid_good"}
  %Plaid.User{password: "plaid_good", username: "plaid_test"}
  iex(4)> Plaid.Api.start
  {:ok, []}
  iex(5)> Plaid.Api.connect(user)
  {:ok, %HTTPoison.Response{} }
  """

  @testParams [
    client_id: "test_id",
    secret: "test_secret",
    type: "wells"
  ]

  def start, do: Plaid.Client.start

  def connect() do
    Plaid.Client.post("/connect", "", [], [params: merge_params(Plaid.Types.User.get_user)])
  end

  defp merge_params(%Plaid.Types.User{} = user) do
    Map.from_struct(user)
    |> Map.to_list
    |> merge_test
  end

  defp merge_test(params) do
    Keyword.merge(@testParams, params)
  end
end
