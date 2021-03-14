import React from 'react'
import { css } from '@emotion/core'
import { string } from 'prop-types'

const makeDataTestId = (transactionId, fieldName) => `transaction-${transactionId}-${fieldName}`

export default function TxTableCellListItem ({ columnKey, id, val }) {
  return (
    <td css={cellStyle} data-testid={makeDataTestId(id, columnKey)}>{val}</td>
  )
}

TxTableCellListItem.propTypes = {
  columnKey: string,
  id: string,
  val: string
}

const cellStyle = css`
  border: 1px solid #b4c1ec;
  padding: 0px 6px;
`
