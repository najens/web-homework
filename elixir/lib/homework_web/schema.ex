defmodule HomeworkWeb.Schema do
  @moduledoc """
  Defines the graphql schema for this project.
  """
  use Absinthe.Schema

  alias HomeworkWeb.Resolvers.CategoriesResolver
  alias HomeworkWeb.Resolvers.CompaniesResolver
  alias HomeworkWeb.Resolvers.MerchantsResolver
  alias HomeworkWeb.Resolvers.TransactionsResolver
  alias HomeworkWeb.Resolvers.UsersResolver
  import_types(HomeworkWeb.Schemas.Types)

  query do
    @desc "Get all Categories"
    field(:categories, list_of(:category)) do
      resolve(&CategoriesResolver.categories/3)
    end

    @desc "Get all Companies"
    field(:companies, list_of(:company)) do
      resolve(&CompaniesResolver.companies/3)
    end

    @desc "Get all Transactions"
    field(:transactions, list_of(:transaction)) do
      arg(:order_by, :transaction_order_by_enum)
      arg(:where, :transaction_where_input_type)
      resolve(&TransactionsResolver.transactions/3)
    end

    @desc "Get all Users"
    field(:users, list_of(:user)) do
      resolve(&UsersResolver.users/3)
    end

    @desc "Get all Merchants"
    field(:merchants, list_of(:merchant)) do
      resolve(&MerchantsResolver.merchants/3)
    end
  end

  mutation do
    import_fields(:category_mutations)
    import_fields(:company_mutations)
    import_fields(:transaction_mutations)
    import_fields(:user_mutations)
    import_fields(:merchant_mutations)
  end
end
