defmodule Twist.ChapterTest do
  use Twist.ModelCase

  alias Twist.Chapter

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Chapter.changeset(%Chapter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Chapter.changeset(%Chapter{}, @invalid_attrs)
    refute changeset.valid?
  end
end
