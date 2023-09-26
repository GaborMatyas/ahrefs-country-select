// @module("../assets/magnifier.svg") external magnifierLogo: string = "default"

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
    <select onChange={handleCountryChange} value={country}>
      <option value="search" disabled=true hidden=true> {React.string("Search")} </option>
      {switch result {
      | Data(countries) =>
        <>
          {countries->Belt.Array.mapWithIndex((i, country) => {
            <option value={country.value} key={`${country.value}-${Belt.Int.toString(i)}`}>
              {React.string(`${country.label}`)}
            </option>
          })}
        </>
      | Loading => React.string("Loading...")
      | _ => React.null
      }}
    </select>
  </div>
}
