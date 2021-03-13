defmodule Homework.Transactions do
  @moduledoc """
  The Transactions context.
  """

  import Ecto.Query, warn: false
  alias Homework.Repo

  alias Homework.Transactions.Transaction

  @doc """
  Returns the list of transactions.

  ## Examples

      iex> list_transactions([])
      [%Transaction{}, ...]

  """
  def list_transactions(args) do
    build_query(args)
    |> Repo.all()
  end

  @doc """
  Gets a single transaction.

  Raises `Ecto.NoResultsError` if the Transaction does not exist.

  ## Examples

      iex> get_transaction!(123)
      %Transaction{}

      iex> get_transaction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transaction!(id), do: Repo.get!(Transaction, id)

  @doc """
  Creates a transaction.

  ## Examples

      iex> create_transaction(%{field: value})
      {:ok, %Transaction{}}

      iex> create_transaction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transaction(attrs \\ %{}) do
    %Transaction{}
    |> Transaction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transaction.

  ## Examples

      iex> update_transaction(transaction, %{field: new_value})
      {:ok, %Transaction{}}

      iex> update_transaction(transaction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transaction(%Transaction{} = transaction, attrs) do
    transaction
    |> Transaction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a transaction.

  ## Examples

      iex> delete_transaction(transaction)
      {:ok, %Transaction{}}

      iex> delete_transaction(transaction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transaction(%Transaction{} = transaction) do
    Repo.delete(transaction)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transaction changes.

  ## Examples

      iex> change_transaction(transaction)
      %Ecto.Changeset{data: %Transaction{}}

  """
  def change_transaction(%Transaction{} = transaction, attrs \\ %{}) do
    Transaction.changeset(transaction, attrs)
  end

  @doc """
  Builds transaction query based on supplied args.
  """
  defp build_query(args) do
    Transaction
    |> maybe_filter_by(args[:where])
    |> maybe_order_by(args[:order_by])
  end

  @doc """
  Adds filters to transaction query if valid filter args supplied.
  """
  defp maybe_filter_by(query, nil), do: query

  defp maybe_filter_by(query, filter) do
    query
    |> maybe_filter_by_amount_lte(filter[:amount_lte])
    |> maybe_filter_by_amount_gte(filter[:amount_gte])
    |> maybe_filter_by_category_id_in(filter[:category_id_in])
    |> maybe_filter_by_company_id_in(filter[:company_id_in])
    |> maybe_filter_by_id_eq(filter[:id_eq])
    |> maybe_filter_by_inserted_at_lte(filter[:inserted_at_lte])
    |> maybe_filter_by_inserted_at_gte(filter[:inserted_at_gte])
    |> maybe_filter_by_merchant_id_in(filter[:merchant_id_in])
    |> maybe_filter_by_user_id_in(filter[:user_id_in])
  end

  @doc """
  Filters transactions by amount less than or equal to provided value.
  """
  defp maybe_filter_by_amount_lte(query, nil), do: query

  defp maybe_filter_by_amount_lte(query, amount) do
    query
    |> where([t], t.amount <= ^amount)
  end

  @doc """
  Filters transactions by amount greater than or equal to provided value.
  """
  defp maybe_filter_by_amount_gte(query, nil), do: query

  defp maybe_filter_by_amount_gte(query, amount) do
    query
    |> where([t], t.amount >= ^amount)
  end

  @doc """
  Filters transactions by the provided category ids.
  """
  defp maybe_filter_by_category_id_in(query, nil), do: query

  defp maybe_filter_by_category_id_in(query, category_ids) do
    query
    |> where([t], t.category_id in ^category_ids)
  end

  @doc """
  Filters transactions by the provided company ids.
  """
  defp maybe_filter_by_company_id_in(query, nil), do: query

  defp maybe_filter_by_company_id_in(query, company_ids) do
    query
    |> where([t], t.company_id in ^company_ids)
  end

  @doc """
  Filters transactions by the provided transaction id.
  """
  defp maybe_filter_by_id_eq(query, nil), do: query

  defp maybe_filter_by_id_eq(query, id) do
    query
    |> where([t], t.id == ^id)
  end

  @doc """
  Filters transactions by inserted timestamp less than or
  equal to provided value.
  """
  defp maybe_filter_by_inserted_at_lte(query, nil), do: query

  defp maybe_filter_by_inserted_at_lte(query, timestamp) do
    query
    |> where([t], t.inserted_at <= ^timestamp)
  end

  @doc """
  Filters transactions by inserted timestamp greater than or
  equal to provided value.
  """
  defp maybe_filter_by_inserted_at_gte(query, nil), do: query

  defp maybe_filter_by_inserted_at_gte(query, timestamp) do
    query
    |> where([t], t.inserted_at >= ^timestamp)
  end

  @doc """
  Filters transactions by the provided merchant ids.
  """
  defp maybe_filter_by_merchant_id_in(query, nil), do: query

  defp maybe_filter_by_merchant_id_in(query, merchant_ids) do
    query
    |> where([t], t.merchant_id in ^merchant_ids)
  end

  @doc """
  Filters transactions by the provided user ids.
  """
  defp maybe_filter_by_user_id_in(query, nil), do: query

  defp maybe_filter_by_user_id_in(query, user_ids) do
    query
    |> where([t], t.user_id in ^user_ids)
  end

  @doc """
  Sorts transaction in ascending or descending order
  by the given value.
  """
  defp maybe_order_by(query, nil), do: query

  defp maybe_order_by(query, :amount_asc) do
    query
    |> order_by([t], asc: t.amount)
  end

  defp maybe_order_by(query, :amount_desc) do
    query
    |> order_by([t], desc: t.amount)
  end

  defp maybe_order_by(query, :category_asc) do
    query
    |> join(:left, [t], c in assoc(t, :category))
    |> preload([t, c], [:category])
    |> order_by([t, c], asc_nulls_last: c.name)
  end

  defp maybe_order_by(query, :category_desc) do
    query
    |> join(:left, [t], c in assoc(t, :category))
    |> preload([t, c], [:category])
    |> order_by([t, c], desc_nulls_last: c.name)
  end

  defp maybe_order_by(query, :description_asc) do
    query
    |> order_by([t], asc: t.description)
  end

  defp maybe_order_by(query, :description_desc) do
    query
    |> order_by([t], desc: t.description)
  end

  defp maybe_order_by(query, :inserted_at_asc) do
    query
    |> order_by([t], asc: t.inserted_at)
  end

  defp maybe_order_by(query, :inserted_at_desc) do
    query
    |> order_by([t], desc: t.inserted_at)
  end

  defp maybe_order_by(query, :merchant_asc) do
    query
    |> join(:left, [t], m in assoc(t, :merchant))
    |> preload([t, m], [:merchant])
    |> order_by([t, m], asc: m.name)
  end

  defp maybe_order_by(query, :merchant_desc) do
    query
    |> join(:left, [t], m in assoc(t, :merchant))
    |> preload([t, m], [:merchant])
    |> order_by([t, m], desc: m.name)
  end

  defp maybe_order_by(query, :user_name_asc) do
    query
    |> join(:left, [t], u in assoc(t, :user))
    |> preload([t, u], [:user])
    |> order_by([t, u], asc: fragment("CONCAT((?), ' ',(?))", u.first_name, u.last_name))
  end

  defp maybe_order_by(query, :user_name_desc) do
    query
    |> join(:left, [t], u in assoc(t, :user))
    |> preload([t, u], [:user])
    |> order_by([t, u], desc: fragment("CONCAT((?), ' ',(?))", u.first_name, u.last_name))
  end
end
