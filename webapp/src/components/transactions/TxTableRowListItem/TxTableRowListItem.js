import React from 'react'
import { bool, func, number, string } from 'prop-types'
import { css } from '@emotion/core'
import TxTableCellList from '../TxTableCellList'

export default function TxTableRowListItem ({
  categoryId,
  categoryName,
  chargeType,
  companyId,
  date,
  description,
  dollarAmount,
  handleOpenTxModal,
  id,
  indexIsOdd,
  merchantId,
  merchantName,
  selected,
  setSelected,
  userId,
  userName
}) {
  function handleRowItemClick (e) {
    e.preventDefault()
    handleClickSrc(e.target.className)
  }

  function handleClickSrc (className) {
    switch (className) {
      case 'edit-tx-button':
        handleEditClick()
        break
      case 'delete-tx-button':
        handleDeleteClick()
        break
      default:
        setSelected(id)
    }
  }

  function handleEditClick () {
    const data = {
      action: 'edit',
      categoryId,
      chargeType,
      companyId,
      description,
      dollarAmount: Math.abs(dollarAmount),
      id,
      merchantId,
      userId
    }
    handleOpenTxModal(data)
  }

  function handleDeleteClick () {
    const data = {
      action: 'delete',
      id
    }
    handleOpenTxModal(data)
  }

  const isSelected = selected === id
  return (
    <tr css={rowStyle(indexIsOdd, isSelected)} data-testid={`transaction-${id}`} onClick={handleRowItemClick}>
      <TxTableCellList
        categoryName={categoryName}
        date={date}
        description={description}
        dollarAmount={dollarAmount}
        id={id}
        isSelected={isSelected}
        merchantName={merchantName}
        userName={userName}
      />
    </tr>
  )
}

TxTableRowListItem.propTypes = {
  categoryId: string,
  categoryName: string,
  chargeType: string,
  companyId: string,
  date: string,
  description: string,
  dollarAmount: number,
  handleOpenTxModal: func,
  id: string,
  indexIsOdd: bool,
  merchantId: string,
  merchantName: string,
  selected: string,
  setSelected: func,
  userId: string,
  userName: string
}

const rowStyle = (addBackground, isSelected) => {
  const backgroundColor = isSelected ? '#6075ca' : addBackground ? '#e4edf9' : null
  return css`
  font-size: 12px;
  line-height: 2.5;
  ${backgroundColor && `
  background-color: ${backgroundColor};
  `}
  ${isSelected && `
  color: #fff;
  `}

  &:hover {
    cursor: pointer;
  }
`
}
