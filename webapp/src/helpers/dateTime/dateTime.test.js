import { getMonthAndDayFromTimestamp } from './dateTime'

describe('Function getMonthAndDayFromTimestamp', () => {
  it('should show convert "2021-03-12T20:00:29" to "Mar 12"', () => {
    const input = '2021-03-12T20:00:29'
    const output = 'Mar 12'
    expect(getMonthAndDayFromTimestamp(input)).toEqual(output)
  })
})
