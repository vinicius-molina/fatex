defmodule Fatex.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Fatex.Repo

  alias Fatex.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> result = list_users()
      iex> with [user | _] <- result,
      ...>      %Fatex.Accounts.User{} <- user, do: :ok
      :ok
  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  ## Examples

      iex> result = get_user(1)
      iex> with %Fatex.Accounts.User{} <- result, do: :ok
      :ok

      iex> get_user(213812)
      nil
  """
  def get_user(id), do: Repo.get(User, id)

  @doc """
  Gets a single user with email info

  ## Examples

      iex> result = get_user_by_email("vinicius_molina@hotmail.com")
      iex> with %Fatex.Accounts.User{} <- result, do: :ok
      :ok

      iex> get_user_by_email("haha")
      nil
  """
  def get_user_by_email(email) do
    Repo.all(
      from u in User,
        where: u.email == ^email
    )
    |> List.first()
  end

  @doc """
  Creates a user.

  ## Examples

      iex> with result = create_user(%{name: "jubileu", email: "jubileu@hotmail.com", password: "hash_secret"}),
      ...>      {:ok, %User{}} <- result, do: :ok
      :ok

      iex> with result <- create_user(%{field: "asdkj"}),
      ...> {:error, %Ecto.Changeset{}} <- result, do: :ok
      :ok
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> u = get_user 1
      iex> with result = update_user(u, %{name: "jubileu"}),
      ...>      {:ok, %User{name: "jubileu"}} <- result, do: :ok
      :ok
  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def verify_user(%User{} = user, password) do
    user
    |> Argon2.check_pass(password)
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> with {:ok, user} = create_user(%{name: "jubileu", email: "jubileu@hotmail.com", password: "hash_secret"}),
      ...>      {:ok, %User{}} <- delete_user(user), do: :ok
      :ok
  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

  iex> with %Ecto.Changeset{} <- change_user(%User{}), do: :ok
  :ok

  """
  def change_user() do
    User.changeset(%User{}, %{})
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def change_user(%User{} = user, params) do
    User.changeset(user, params)
  end
end
