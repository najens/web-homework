import React from 'react'
import { create } from 'react-test-renderer'
import TxTableHeaderListItem from './TxTableHeaderListItem'

// Only testing render since the business logic tested in parent component
describe('TxTableHeaderListItem component', () => {
  it('renders correctly', () => {
    const testRenderer = create(
      <TxTableHeaderListItem
        asc='INSERTED_AT_ASC'
        desc='INSERTED_AT_DESC'
        heading='Date'
        key='date'
        orderBy='INSERTED_AT_DESC'
        refetchTransactions={() => null}
        setOrderBy={() => null}
        width='10%'
      />
    )
    expect(testRenderer.toJSON()).toMatchSnapshot()
  })
})
