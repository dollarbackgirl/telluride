defmodule Plaid.Api do

  def connect(_user, _type) do
    Plaid.Client.post("/connect")
  end

end
