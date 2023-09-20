@react.component
let make = () => {
  let (currentCountry, setCurrentCountry) = React.useState(_ => "search")

  let onCountryChange = (country: string) => {
    setCurrentCountry(_ => country)
    Js.log(`${country}`)
  }

  <div className="h-screen-dvh w-screen-dvh flex justify-center pt-32">
    <CountrySelect country=currentCountry className={"w-[230px]"} onChange={onCountryChange} />
  </div>
}
