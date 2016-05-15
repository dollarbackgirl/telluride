defmodule Plaid.Clienttest do
  use ExUnit.Case

  setup do
    transaction = %{ "transactions" => [%{
      "amount" => "12.74",
      "date" => "2016-03-12",
      "name" => "Golden Crepes"
    }]}

    {:ok, transaction}
  end

  test "process_response_body", json do
    response_body = Plaid.Client.process_response_body(Poison.encode!(json))
    expected = %{transactions: [%Plaid.Types.Transaction{amount: "12.74", date: "2016-03-12", name: "Golden Crepes"}]}
    assert response_body == expected
  end
end
