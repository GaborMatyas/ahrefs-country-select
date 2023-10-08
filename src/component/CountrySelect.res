type option = {
  value: string,
  label: string,
}

@react.component
let make = (~country: string, ~className: string, ~onChange: string => unit) => {
  let result = UseCountriesHook.useCountries()

  let handleCountryChange = e => {
    let newCountry = ReactEvent.Form.target(e)["value"]
    onChange(newCountry)
    Js.log(` ~ file: CountrySelect.res:18 ~ handleCountryChange ~ newCountry:", ${newCountry}`)
  }

  <div className>
    <Button> {React.string(`${country}`)} </Button>
    {switch result {
    | Data(countries) =>
      <ReactSelect
        options=countries
        defaultInputValue={"Search ..."}
        components={
          option: OptionWithFlag.make,
        }
      />
    | Loading => React.string("Loading...")
    | _ => React.null
    }}
  </div>
}
