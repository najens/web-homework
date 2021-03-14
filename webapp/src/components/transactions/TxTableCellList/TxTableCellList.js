import React from 'react'
import { string } from 'prop-types'
import TxTableCellListItem from '../TxTableCellListItem'

export default function TxTableCellList ({ categoryName, date, description, dollarAmount, id, merchantName, userName }) {
  const rowCells = [
    { key: 'date', val: date },
    { key: 'userName', val: userName },
    { key: 'description', val: description },
    { key: 'merchantName', val: merchantName },
    { key: 'category', val: categoryName },
    { key: 'amount', val: dollarAmount }
  ]

  return rowCells.map(cell => {
    const { key, val } = cell
    return (
      <TxTableCellListItem columnKey={key} id={id} key={`transaction-${id}-${key}`} val={val} />
    )
  })
}

TxTableCellList.propTypes = {
  categoryName: string,
  date: string,
  description: string,
  dollarAmount: string,
  id: string,
  merchantName: string,
  userName: string
}
