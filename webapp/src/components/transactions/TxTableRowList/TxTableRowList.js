import React, { useState } from 'react'
import { arrayOf, string, bool, number, shape, func } from 'prop-types'
import { getMonthAndDayFromTimestamp } from '../../../helpers/dateTime'
import { convertCentsToUsDollars } from '../../../helpers/currency'
import TxTableRowListItem from '../TxTableRowListItem'

export default function TxTableRowList ({ data, handleOpenTxModal }) {
  const [selected, setSelected] = useState(null)
  return data.map((tx, index) => {
    const {
      id,
      insertedAt,
      category,
      company: { id: companyId },
      credit,
      debit,
      user: { id: userId, firstName, lastName },
      description,
      merchant: { id: merchantId, name: merchantName },
      amount
    } = tx

    const categoryName = category ? category.name : 'None'
    const categoryId = category ? category.id : ''
    const userName = `${firstName} ${lastName}`
    const date = getMonthAndDayFromTimestamp(insertedAt)
    let dollarAmount = convertCentsToUsDollars(amount)
    if (debit) {
      dollarAmount = dollarAmount * -1
    }
    const indexIsOdd = index % 2 !== 0
    const chargeType = credit ? 'credit' : debit ? 'debit' : ''

    return (
      <TxTableRowListItem
        categoryId={categoryId}
        categoryName={categoryName}
        chargeType={chargeType}
        companyId={companyId}
        credit={credit}
        date={date}
        debit={debit}
        description={description}
        dollarAmount={dollarAmount}
        handleOpenTxModal={handleOpenTxModal}
        id={id}
        indexIsOdd={indexIsOdd}
        key={`transaction-${id}`}
        merchantId={merchantId}
        merchantName={merchantName}
        selected={selected}
        setSelected={setSelected}
        userId={userId}
        userName={userName}
      />
    )
  })
}

TxTableRowList.propTypes = {
  data: arrayOf(shape({
    amount: number,
    category: shape({
      id: string,
      name: string
    }),
    company: shape({
      id: string,
      name: string
    }),
    credit: bool,
    debit: bool,
    description: string,
    id: string,
    inserted_at: string,
    merchant: shape({
      id: string,
      name: string
    }),
    user: shape({
      id: string,
      firstName: string,
      lastName: string
    })
  })),
  handleOpenTxModal: func
}
