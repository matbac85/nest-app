defmodule Nest.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Nest.Repo

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
    |> validate_length(:password,
      min: 8,
      message: "Le mot de passe doit comporter au minimum %{count} caractères"
    )
    |> set_password_hash(attrs)
    |> validate_required([:firstname, :lastname, :email, :password], message: "ne peut être vide")
    |> validate_format(:email, ~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i,
      message: "format d'email invalide"
    )
    |> unique_constraint(:email,
      name: "users_email_index",
      message: "Cet utilisateur existe déjà"
    )
  end

  def check_password(email, password) do
    with {:ok, user} <- get_user(email),
         :ok <- verify_password(user, password) do
      {:ok, user}
    else
      error -> error
    end
  end

  defp get_user(email) do
    if user = Repo.get_by(Nest.User, email: email) do
      {:ok, user}
    else
      {:error, "Email ou mot de passe invalide"}
    end
  end

  def verify_password(user, password) do
    if Argon2.verify_pass(password, user.password_hash) do
      {:ok, user}
    else
      {:error, "Email ou mot de passe invalide"}
    end
  end

  defp set_password_hash(changeset, %{"password" => password}) do
    put_change(changeset, :password_hash, Argon2.hash_pwd_salt(password))
  end

  defp set_password_hash(changeset, _), do: changeset
end
