import React, { useState } from 'react'
import TxTableHeaderListItem from '../TxTableHeaderListItem'
import { func } from 'prop-types'

export default function TxTableHeaderList ({ refetchTransactions }) {
  const [orderBy, setOrderBy] = useState('INSERTED_AT_DESC')

  const tableHeadings = [
    {
      asc: 'INSERTED_AT_ASC',
      desc: 'INSERTED_AT_DESC',
      heading: 'Date',
      key: 'date',
      width: '10%'
    },
    {
      asc: 'USER_NAME_ASC',
      desc: 'USER_NAME_DESC',
      heading: 'User',
      key: 'user',
      width: '15%'
    },
    {
      asc: 'DESCRIPTION_ASC',
      desc: 'DESCRIPTION_DESC',
      heading: 'Description',
      key: 'description',
      width: '25%'
    },
    {
      asc: 'MERCHANT_ASC',
      desc: 'MERCHANT_DESC',
      heading: 'Merchant',
      key: 'merchant',
      width: '15%'
    },
    {
      asc: 'CATEGORY_ASC',
      desc: 'CATEGORY_DESC',
      heading: 'Category',
      key: 'category',
      width: '15%'
    },
    {
      asc: '',
      desc: '',
      heading: '',
      key: 'filler',
      width: '8%'
    },
    {
      asc: 'AMOUNT_ASC',
      desc: 'AMOUNT_DESC',
      heading: 'Amount',
      key: 'amount',
      width: '12%'
    }
  ]
  return tableHeadings.map(th => {
    const {
      asc,
      desc,
      heading,
      key,
      width
    } = th

    return (
      <TxTableHeaderListItem
        asc={asc}
        desc={desc}
        heading={heading}
        key={`tx-header-${key}`}
        orderBy={orderBy}
        refetchTransactions={refetchTransactions}
        setOrderBy={setOrderBy}
        width={width}
      />
    )
  })
}

TxTableHeaderList.propTypes = {
  refetchTransactions: func
}
