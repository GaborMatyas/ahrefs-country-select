open Countries

module Codecs = {
  let country = Jzon.object2(
    ({label, value}) => (label, value),
    ((label, value)) => {label, value}->Ok,
    Jzon.field("label", Jzon.string),
    Jzon.field("value", Jzon.string),
  )

  let countries = Jzon.array(country)
}
