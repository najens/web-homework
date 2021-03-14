import { convertCentsToUsDollars } from './currency'

describe('Function convertCentsToUsDollars', () => {
  it('should show convert "999" to "$9.99"', () => {
    const input = 999
    const output = '$9.99'
    expect(convertCentsToUsDollars(input)).toEqual(output)
  })
})
