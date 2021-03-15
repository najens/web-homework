import React from 'react'
import { css } from '@emotion/core'
import { ArrowDropUp, ArrowDropDown } from '@material-ui/icons'
import { string, func } from 'prop-types'

export default function TxTableHeaderListItem ({ asc, desc, heading, orderBy, refetchTransactions, setOrderBy, width }) {
  const isAsc = orderBy === asc
  const isDesc = orderBy === desc
  const isFiller = heading === ''

  function handleHeaderClick () {
    const newOrderBy = isDesc ? asc : desc
    refetchTransactions({ orderBy: newOrderBy })
    setOrderBy(newOrderBy)
  }

  return (
    <th css={headerStyle} style={{ width }}>
      {!isFiller && (
        <button css={buttonStyle} onClick={handleHeaderClick}>
          <span>{heading}</span>
          {isAsc && <ArrowDropUp style={{ fontSize: 24 }} />}
          {isDesc && <ArrowDropDown style={{ fontSize: 24 }} />}
        </button>
      )}
    </th>
  )
}

TxTableHeaderListItem.propTypes = {
  asc: string,
  desc: string,
  heading: string,
  orderBy: string,
  refetchTransactions: func,
  setOrderBy: func,
  width: string
}

const headerStyle = css`
  border: 1px solid #b4c1ec;
`

const buttonStyle = css`
  align-items: center;
  background: none;
  border: none;
  display: flex;
  flex-direction: row;
  height: 24px;
  justify-content: flex-start;
  padding: 0px 6px;
  width: 100%;
  -moz-appearance: none;
  -webkit-appearance: none;

  &:focus {
    outline: none;
  }

  &:hover {
    cursor: pointer;
  }
`
