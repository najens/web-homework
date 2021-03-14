import React from 'react'
import { arrayOf, string, bool, number, shape, func } from 'prop-types'
import { css } from '@emotion/core'
import TxTableHeaderList from '../TxTableHeaderList'
import TxTableRowList from '../TxTableRowList'

export default function TxTable ({ data, refetchTransactions }) {
  return (
    <table css={tableStyle}>
      <tbody>
        <tr css={headerStyle}>
          <TxTableHeaderList refetchTransactions={refetchTransactions} />
        </tr>
        <TxTableRowList data={data} />
      </tbody>
    </table>
  )
}

TxTable.propTypes = {
  data: arrayOf(shape({
    amount: number,
    category: shape({
      name: string
    }),
    credit: bool,
    debit: bool,
    description: string,
    id: string,
    inserted_at: string,
    merchant: shape({
      name: string
    }),
    user: shape({
      firstName: string,
      lastName: string
    })
  })),
  refetchTransactions: func
}

const headerStyle = css`
  background: linear-gradient(180deg, #e4edf9, #62a2f9bf);
  font-size: 12px;
  font-weight: bold;
  overflow-x: scroll;
`
const tableStyle = css`
  border-collapse: collapse;
  width: 90vw;
`
