import React from 'react'
import { create } from 'react-test-renderer'
import TxTableRowListItem from './TxTableRowListItem'

// Only testing render since this component has no business logic
describe('TxTableRowListItem component', () => {
  it('renders correctly', () => {
    const testRenderer = create(
      <TxTableRowListItem
        categoryName='Restaurant'
        date='Mar 11'
        description='Test'
        dollarAmount='$1.00'
        id='3810c583-1307-4433-8900-8ad6d743f13d'
        indexIsOdd
        merchantName='Taco Bell'
        userName='John Doe'
      />
    )
    expect(testRenderer.toJSON()).toMatchSnapshot()
  })
})
