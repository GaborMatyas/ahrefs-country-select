let fallbackButtonProps: UseCountriesHook.country = {label: "No selected Country", value: "xx"}

@react.component
let make = (
  ~className: option<string>=?,
  ~value: option<UseCountriesHook.country>=?,
  ~onClick: unit => unit,
  ~autoFocus: bool,
  ~buttonRef: ReactDOM.domRef,
) => {
  let classList = switch className {
  | Some(customClass) => `${customClass}`
  | None => ""
  }

  <button type_="button" className={classList} onClick={_ => onClick()} autoFocus ref=buttonRef>
    {
      let buttonData = switch value {
      | Some(country) => country
      | None => fallbackButtonProps
      }
      <>
        <FlagIcon country={buttonData.value} />
        {buttonData.label->React.string}
      </>
    }
    <TriangleNeutralIcon />
  </button>
}
