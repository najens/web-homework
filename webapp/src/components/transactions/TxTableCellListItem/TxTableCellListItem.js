import React from 'react'
import { css } from '@emotion/core'
import { bool, string } from 'prop-types'
import { Delete, Edit } from '@material-ui/icons'

const makeDataTestId = (transactionId, fieldName) => `transaction-${transactionId}-${fieldName}`

export default function TxTableCellListItem ({ columnKey, id, isSelected, val }) {
  const isAmount = columnKey === 'amount'
  const isFiller = columnKey === 'filler'

  if (isFiller && isSelected) {
    val = (
      <div css={wrapperStyle}>
        <button className={'edit-tx-button'}>
          <Edit style={{ pointerEvents: 'none' }} />
        </button>
        <button className={'delete-tx-button'}>
          <Delete style={{ pointerEvents: 'none' }} />
        </button>
      </div>
    )
  }

  if (isAmount) {
    val = val > 0 ? `${val} $ +` : `${val * -1} $`
  }

  return (
    <td css={cellStyle(isAmount)} data-testid={makeDataTestId(id, columnKey)}>{val}</td>
  )
}

TxTableCellListItem.propTypes = {
  columnKey: string,
  id: string,
  isSelected: bool,
  val: string
}

const cellStyle = (dirRtl) => css`
  border: 1px solid #b4c1ec;
  padding: 0px 6px;
  ${dirRtl && `
  direction: rtl;
  `}
`

const wrapperStyle = css`
  align-items: center;
  display: flex;
  font-size: 8px;
  justify-content: space-between;

  & > button {
    background: none;
    border: none;
    color: #fff;
    -moz-appearance: none;
    -webkit-appearance: none;

    &:focus {
      outline: none;
    }

    &:hover {
      color: #b1d8f5;
      cursor: pointer;
    }
  }
`
