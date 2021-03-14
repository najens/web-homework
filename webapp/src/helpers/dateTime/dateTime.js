import moment from 'moment'

const MONTH_DAY = 'MMM DD'

export function getMonthAndDayFromTimestamp (timestamp) {
  const date = new Date(timestamp)
  return moment(date).format(MONTH_DAY)
}
