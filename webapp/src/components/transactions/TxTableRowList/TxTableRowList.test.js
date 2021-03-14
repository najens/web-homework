import React from 'react'
import { create } from 'react-test-renderer'
import TxTableRowList from './TxTableRowList'

// Only testing render since this component has no business logic
describe('TxTableRowList component', () => {
  it('renders correctly', () => {
    const data = [
      {
        __typename: 'Transaction',
        id: '782a1d8d-08dc-4ef8-bab0-d922038971a2',
        insertedAt: '2021-03-12T20:00:29',
        user: {
          __typename: 'User',
          firstName: 'Bobby',
          lastName: 'Smith'
        },
        category:{
          __typename: 'Category',
          name: 'Medical'
        },
        description: 'Hot Dogs',
        merchant: {
          __typename: 'Merchant',
          name: 'Taco Bell'
        },
        debit: true,
        credit: false,
        amount: 304
      }
    ]

    const testRenderer = create(<TxTableRowList data={data} />)
    expect(testRenderer.toJSON()).toMatchSnapshot()
  })
})
