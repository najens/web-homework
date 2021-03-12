defmodule HomeworkWeb.Schemas.TransactionsSchema do
  @moduledoc """
  Defines the graphql schema for transactions.
  """
  use Absinthe.Schema.Notation

  alias HomeworkWeb.Resolvers.TransactionsResolver

  object :transaction do
    field(:id, non_null(:id))
    field(:user_id, :id)
    field(:amount, :integer)
    field(:category_id, :id)
    field(:company_id, :id)
    field(:credit, :boolean)
    field(:debit, :boolean)
    field(:description, :string)
    field(:merchant_id, :id)
    field(:inserted_at, :naive_datetime)
    field(:updated_at, :naive_datetime)

    field(:user, :user) do
      resolve(&TransactionsResolver.user/3)
    end

    field(:merchant, :merchant) do
      resolve(&TransactionsResolver.merchant/3)
    end

    field(:company, :company) do
      resolve(&TransactionsResolver.company/3)
    end

    field(:category, :category) do
      resolve(&TransactionsResolver.category/3)
    end
  end

  object :transaction_mutations do
    @desc "Create a new transaction"
    field :create_transaction, :transaction do
      arg(:user_id, non_null(:id))
      arg(:merchant_id, non_null(:id))
      arg(:company_id, non_null(:id))
      arg(:category_id, :id)
      @desc "amount is in cents"
      arg(:amount, non_null(:integer))
      arg(:credit, non_null(:boolean))
      arg(:debit, non_null(:boolean))
      arg(:description, non_null(:string))

      resolve(&TransactionsResolver.create_transaction/3)
    end

    @desc "Update a new transaction"
    field :update_transaction, :transaction do
      arg(:id, non_null(:id))
      arg(:user_id, non_null(:id))
      arg(:merchant_id, non_null(:id))
      arg(:company_id, non_null(:id))
      arg(:category_id, :id)
      @desc "amount is in cents"
      arg(:amount, non_null(:integer))
      arg(:credit, non_null(:boolean))
      arg(:debit, non_null(:boolean))
      arg(:description, non_null(:string))

      resolve(&TransactionsResolver.update_transaction/3)
    end

    @desc "delete an existing transaction"
    field :delete_transaction, :transaction do
      arg(:id, non_null(:id))

      resolve(&TransactionsResolver.delete_transaction/3)
    end
  end

  @desc "Fields to sort transactions by"
  enum :transaction_order_by_enum do
    value :amount_asc, description: "Sort by amount in ascending order"
    value :amount_desc, description: "Sort by amount in descending order"
    value :category_asc, description: "Sort by category in ascending order"
    value :category_desc, description: "Sort by category in descending order"
    value :description_asc, description: "Sort by description in ascending order"
    value :description_desc, description: "Sort by description in descending order"
    value :inserted_at_asc, description: "Sort by inserted_at in ascending order"
    value :inserted_at_desc, description: "Sort by inserted_at in descending order"
    value :merchant_asc, description: "Sort by merchant in ascending order"
    value :merchant_desc, description: "Sort by merchant in descending order"
  end

  @desc "Fields to filter transactions by"
  input_object :transaction_where_input_type do
    field :id_eq, :id
    field :amount_gte, :integer
    field :amount_lte, :integer
    field :category_id_in, list_of(:id)
    field :company_id_in, list_of(:id)
    field :inserted_at_gte, :naive_datetime
    field :inserted_at_lte, :naive_datetime
    field :merchant_id_in, list_of(:id)
    field :user_id_in, list_of(:id)
  end
end
