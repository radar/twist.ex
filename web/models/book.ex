defmodule Twist.Book do
  use Twist.Web, :model

  schema "books" do
    field :path, :string
    field :title, :string
    field :blurb, :string
    field :permalink, :string

    belongs_to :account, Twist.Account
  end

  @required_fields ~w()
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
