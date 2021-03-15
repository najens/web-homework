import React from 'react'
import { create, act } from 'react-test-renderer'
import TxTableHeaderListItem from '../TxTableHeaderListItem'
import TxTableHeaderList from './TxTableHeaderList'
import { ArrowDropUp, ArrowDropDown } from '@material-ui/icons'

describe('the TxTableHeaderList component', () => {
  let testRenderer

  beforeEach(() => {
    testRenderer = create(
      <TxTableHeaderList refetchTransactions={() => null} />
    )
  })

  test('it renders correctly', () => {
    expect(testRenderer.toJSON()).toMatchSnapshot()
  })

  test('it renders 7 TxTableHeaderListItem children', () => {
    const testInstance = testRenderer.root
    const headers = testInstance.findAllByType(TxTableHeaderListItem)
    expect(headers).toHaveLength(7)
  })

  describe('the TxTableHeaderListItem child components', () => {
    describe('rendering arrow icons on table headers', () => {
      let firstHeader
      let secondHeader

      beforeEach(() => {
        const testRenderer = create(
          <TxTableHeaderList refetchTransactions={() => null} />
        )
        const testInstance = testRenderer.root
        const headers = testInstance.findAllByType(TxTableHeaderListItem)
        firstHeader = headers[0]
        secondHeader = headers[1]
      })

      test('the first header should render ArrowDropDown', () => {
        expect(firstHeader.findAllByType(ArrowDropDown)).toHaveLength(1)
      })

      test('the first header should not render ArrowDropUp', () => {
        expect(firstHeader.findAllByType(ArrowDropUp)).toHaveLength(0)
      })

      test('the second header should not render ArrowDropDown', () => {
        expect(secondHeader.findAllByType(ArrowDropDown)).toHaveLength(0)
      })

      test('the second header should not render ArrowDropUp', () => {
        expect(secondHeader.findAllByType(ArrowDropUp)).toHaveLength(0)
      })

      describe('first table header button click', () => {
        let firstHeader
        let secondHeader
        beforeEach(() => {
          const testRenderer = create(
            <TxTableHeaderList refetchTransactions={() => null} />
          )
          const testInstance = testRenderer.root
          const headers = testInstance.findAllByType(TxTableHeaderListItem)
          firstHeader = headers[0]
          secondHeader = headers[1]
          const button = firstHeader.findByType('button')
          act(() => button.props.onClick())
        })

        test('it should not render ArrowDropDown', () => {
          expect(firstHeader.findAllByType(ArrowDropDown)).toHaveLength(0)
        })

        test('it should render ArrowDropUp', () => {
          expect(firstHeader.findAllByType(ArrowDropUp)).toHaveLength(1)
        })

        test('the second header should not render ArrowDropDown', () => {
          expect(secondHeader.findAllByType(ArrowDropDown)).toHaveLength(0)
        })

        test('the second header should not render ArrowDropUp', () => {
          expect(secondHeader.findAllByType(ArrowDropUp)).toHaveLength(0)
        })
      })

      describe('second table header button click', () => {
        let firstHeader
        let secondHeader

        beforeEach(() => {
          const testRenderer = create(
            <TxTableHeaderList refetchTransactions={() => null} />
          )
          const testInstance = testRenderer.root
          const headers = testInstance.findAllByType(TxTableHeaderListItem)
          firstHeader = headers[0]
          secondHeader = headers[1]
          const button = secondHeader.findByType('button')
          act(() => button.props.onClick())
        })

        test('the first header should render ArrowDropDown', () => {
          expect(firstHeader.findAllByType(ArrowDropDown)).toHaveLength(0)
        })

        test('the first header should not render ArrowDropUp', () => {
          expect(firstHeader.findAllByType(ArrowDropUp)).toHaveLength(0)
        })

        test('the second header should not render ArrowDropDown', () => {
          expect(secondHeader.findAllByType(ArrowDropDown)).toHaveLength(1)
        })

        test('the second header should not render ArrowDropUp', () => {
          expect(secondHeader.findAllByType(ArrowDropUp)).toHaveLength(0)
        })
      })
    })
  })
})
