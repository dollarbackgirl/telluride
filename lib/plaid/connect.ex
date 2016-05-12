defmodule Plaid.Api do
  import Plaid.User

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

  def connect(%Plaid.User{}=user) do
    Plaid.Client.post("/connect", "", [], [params: merge_params(user)])
  end

  defp merge_params(%Plaid.User{} = user) do
    merge_test = &Keyword.merge(@testParams, &1) # Partial function application

    Map.from_struct(user)
      |> Map.to_list
      |> merge_test.() # Elixir has weird syntax for applying anonymous functions
  end
end
