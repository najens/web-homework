export function convertCentsToUsDollars (cents) {
  return cents / 100
}

export function convertDollarsToCents (dollars) {
  return dollars * 100
}

export function validateDollarCents (numStr) {
  const regex = /^[0-9]*\.[0-9][0-9]$/
  return regex.test(numStr)
}
