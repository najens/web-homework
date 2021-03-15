import React from 'react'
import { bool, number, string } from 'prop-types'
import TxTableCellListItem from '../TxTableCellListItem'

export default function TxTableCellList ({
  categoryName,
  date,
  description,
  dollarAmount,
  id,
  isSelected,
  merchantName,
  userName
}) {
  const rowCells = [
    { key: 'date', val: date },
    { key: 'userName', val: userName },
    { key: 'description', val: description },
    { key: 'merchantName', val: merchantName },
    { key: 'category', val: categoryName },
    { key: 'filler', val: '' },
    { key: 'amount', val: dollarAmount.toString() }
  ]

  return rowCells.map(cell => {
    const { key, val } = cell
    return (
      <TxTableCellListItem
        columnKey={key}
        id={id}
        isSelected={isSelected}
        key={`transaction-${id}-${key}`}
        val={val}
      />
    )
  })
}

TxTableCellList.propTypes = {
  categoryName: string,
  date: string,
  description: string,
  dollarAmount: number,
  id: string,
  isSelected: bool,
  merchantName: string,
  userName: string
}
