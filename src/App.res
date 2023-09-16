@react.component
let make = () => {
  let (currentCountry, setCounsetCurrentCountry) = React.useState(() => "United States")

  <div className="h-screen-dvh w-screen-dvh flex justify-center pt-32">
         <CountrySelect country=currentCountry className={"w-[230px]"}/>
  </div>
}
