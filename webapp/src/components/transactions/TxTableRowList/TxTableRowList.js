import React from 'react'
import { arrayOf, string, bool, number, shape } from 'prop-types'
import { getMonthAndDayFromTimestamp } from '../../../helpers/dateTime'
import { convertCentsToUsDollars } from '../../../helpers/currency'
import TxTableRowListItem from '../TxTableRowListItem'

export default function TxTableRowList ({ data }) {
  return data.map((tx, index) => {
    const {
      id,
      insertedAt,
      category,
      user: { firstName, lastName },
      description,
      merchant: { name: merchantName },
      amount
    } = tx

    const categoryName = category ? category.name : 'None'
    const userName = `${firstName} ${lastName}`
    const date = getMonthAndDayFromTimestamp(insertedAt)
    const dollarAmount = convertCentsToUsDollars(amount)
    const indexIsOdd = index % 2 !== 0
    return (
      <TxTableRowListItem
        categoryName={categoryName}
        date={date}
        description={description}
        dollarAmount={dollarAmount}
        id={id}
        indexIsOdd={indexIsOdd}
        key={`transaction-${id}`}
        merchantName={merchantName}
        userName={userName}
      />
    )
  })
}

TxTableRowList.propTypes = {
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
  }))
}
