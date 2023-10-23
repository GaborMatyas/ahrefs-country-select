@react.component
let make = (
  ~className: option<string>=?,
  ~value: option<UseCountriesHook.country>=?,
  ~onClick: unit => unit,
) => {
  let classList = switch className {
  | Some(customClass) => `${customClass}`
  | None => ""
  }

  <button type_="button" className={classList} onClick={_ => onClick()}>
    {switch value {
    | Some(country) =>
      <>
        <FlagIcon country={country.value} />
        {country.label->React.string}
      </>
    | None => <> </>
    }}
    <TriangleNeutral />
  </button>
}
