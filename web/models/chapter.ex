defmodule Twist.Chapter do
  use Twist.Web, :model

  schema "chapters" do
    field :title, :string
    field :permalink, :string
    field :part, :string
    field :position, :integer
    belongs_to :book, Twist.Book
    has_many :elements, Twist.Element

    timestamps [inserted_at: :created_at]
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
