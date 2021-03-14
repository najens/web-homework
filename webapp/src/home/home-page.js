import React, { Fragment } from 'react'
import { useQuery } from '@apollo/client'
import GetTransactions from '../gql/transactions.gql'
import TxTable from '../components/transactions/TxTable'

export function Home () {
  const { loading, error, data, refetch = {} } = useQuery(GetTransactions, { variables: { orderBy: 'INSERTED_AT_DESC' } })

  if (loading) {
    return (
      <Fragment>
        Loading...
      </Fragment>
    )
  }

  if (error) {
    return (
      <Fragment>
        ¯\_(ツ)_/¯
      </Fragment>
    )
  }

  return (
    <Fragment>
      <TxTable data={data.transactions} refetchTransactions={refetch} />
    </Fragment>
  )
}
