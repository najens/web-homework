import { convertCentsToUsDollars, convertDollarsToCents, validateDollarCents } from './currency'

describe('Function convertCentsToUsDollars', () => {
  it('should show convert "999" to "9.99"', () => {
    const input = 999
    const output = 9.99
    expect(convertCentsToUsDollars(input)).toEqual(output)
  })
})

describe('Function convertDollarsToCents', () => {
  it('should show convert "9.99" to "999"', () => {
    const input = 9.99
    const output = 999
    expect(convertDollarsToCents(input)).toEqual(output)
  })
})

describe('Function validateDollarCents', () => {
  it('should show validate "9.99" to "true"', () => {
    const input = 9.99
    const output = true
    expect(validateDollarCents(input)).toEqual(output)
  })

  it('should show validate "9.999" to "false"', () => {
    const input = 9.999
    const output = false
    expect(validateDollarCents(input)).toEqual(output)
  })

  it('should show validate "$9.99" to "false"', () => {
    const input = '$9.99'
    const output = false
    expect(validateDollarCents(input)).toEqual(output)
  })

  it('should show validate "9.9" to "false"', () => {
    const input = 9.9
    const output = false
    expect(validateDollarCents(input)).toEqual(output)
  })

  it('should show validate "9" to "false"', () => {
    const input = 9
    const output = false
    expect(validateDollarCents(input)).toEqual(output)
  })
})
