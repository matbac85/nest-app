defmodule Nest.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :firstname, :string
    field :lastname, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:firstname, :lastname, :email, :password])
    |> validate_length(:password, min: 8)
    |> set_password_hash(attrs)
    |> validate_required([:firstname, :lastname, :email, :password])
    |> unique_constraint(:email, name: "users_email_index")
  end

  defp set_password_hash(changeset, %{"password" => password}) do
    put_change(changeset, :password_hash, Argon2.hash_pwd_salt(password))
  end

  defp set_password_hash(changeset, _), do: changeset
end
