defmodule Plaid.Types.User do
  @derive [Poison.Encoder]
  defstruct username: nil, password: nil

  def get_user, do: %Plaid.Types.User{ username: "plaid_test", password: "plaid_good"}
end
