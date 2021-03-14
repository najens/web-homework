import React from 'react'
import { bool, string } from 'prop-types'
import { css } from '@emotion/core'
import TxTableCellList from '../TxTableCellList'

export default function TxTableRowListItem ({ categoryName, date, description, dollarAmount, id, indexIsOdd, merchantName, userName }) {
  return (
    <tr css={rowStyle(indexIsOdd)} data-testid={`transaction-${id}`}>
      <TxTableCellList
        categoryName={categoryName}
        date={date}
        description={description}
        dollarAmount={dollarAmount}
        id={id}
        merchantName={merchantName}
        userName={userName}
      />
    </tr>
  )
}

TxTableRowListItem.propTypes = {
  categoryName: string,
  date: string,
  description: string,
  dollarAmount: string,
  id: string,
  indexIsOdd: bool,
  merchantName: string,
  userName: string
}

const rowStyle = (addBackground) => css`
  font-size: 12px;
  line-height: 2;
  ${addBackground && `
  background-color: #e4edf9;
  `}
`
