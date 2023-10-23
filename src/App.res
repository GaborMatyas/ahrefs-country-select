let queryClient = ReactQuery.Provider.createClient()

@react.component
let make = () => {
  <ReactQuery.Provider client={queryClient}>
    <div className="h-screen-dvh w-screen-dvh flex justify-center pt-32">
      <CountrySelect
        country=Some("us")
        className={"w-[230px]"}
        onChange={country => {
          Js.log(country)
        }}
      />
    </div>
  </ReactQuery.Provider>
}
