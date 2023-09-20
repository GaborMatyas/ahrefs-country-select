@module("../assets/magnifier.svg") external magnifierLogo: string = "default"

type option = {
  value: string,
  label: string,
}

let options = [
  {value: "chocolate", label: "Chocolate"},
  {value: "strawberry", label: "Strawberry"},
  {value: "vanilla", label: "Vanilla"},
]

@react.component
let make = (~country: string, ~className: string, ~onChange: string => unit) => {
  let handleCountryChange = e => {
    let newCountry = ReactEvent.Form.target(e)["value"]
    onChange(newCountry)
    Js.log(` ~ file: CountrySelect.res:18 ~ handleCountryChange ~ newCountry:", ${newCountry}`)
  }

  <div className>
    <Button> {React.string(`${country}`)} </Button>
    <select onChange={handleCountryChange} value={country}>
      <option value="search" disabled=true hidden=true> {React.string("Search")} </option>
      {options
      ->Belt.Array.mapWithIndex((i, option) => {
        <option value={option.value} key={`${option.value}-${Belt.Int.toString(i)}`}>
          {React.string(`${option.label}`)}
        </option>
      })
      ->React.array}
    </select>
  </div>
}
