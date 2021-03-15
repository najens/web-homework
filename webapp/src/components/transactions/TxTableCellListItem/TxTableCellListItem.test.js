import React from 'react'
import { create } from 'react-test-renderer'
import TxTableCellListItem from './TxTableCellListItem'

// Only testing render since this component has no business logic
describe('TxTableCellListItem component', () => {
  it('renders correctly', () => {
    const testRenderer = create(
      <TxTableCellListItem
        columnKey='amount'
        id='782a1d8d-08dc-4ef8-bab0-d922038971a2'
        val='1.00'
      />
    )
    expect(testRenderer.toJSON()).toMatchSnapshot()
  })
})
