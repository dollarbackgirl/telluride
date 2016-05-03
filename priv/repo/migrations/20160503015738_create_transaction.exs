defmodule Telluride.Repo.Migrations.CreateTransaction do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :name, :string
      add :amount, :decimal
      add :date, :datetime

      timestamps
    end

  end
end
