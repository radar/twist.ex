defmodule Twist.Element do
  use Twist.Web, :model

  schema "elements" do
    belongs_to :chapter, Twist.Chapter
    field :tag, :string
    field :title, :string
    field :content, :string

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
