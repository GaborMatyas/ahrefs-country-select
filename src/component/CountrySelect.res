type option = {
  value: string,
  label: string,
}

@react.component
let make = (
  ~country: option<string>,
  ~className: string,
  ~onChange: option<UseCountriesHook.country => unit>=?,
) => {
  let (_isLoading, _error, countries, _signal) = UseCountriesHook.useCountries()

  let (value, setValue) = React.useState(() => None)
  let (isDropdownOpen, setIsDropdownOpen) = React.useState(() => false)
  let closeDropdown = () => setIsDropdownOpen(_ => false)

  let selectContainerRef: React.ref<Js.Nullable.t<Dom.element>> = React.useRef(Js.Nullable.null)

  React.useEffect1(() => {
    open Js.String2
    let value = switch country {
    | Some(countryFromParent) =>
      countries->Belt.Array.getByU((. countryListItem) =>
        toLowerCase(countryListItem.value) == toLowerCase(countryFromParent)
      )
    | None => None
    }
    setValue(_ => value)
    None
  }, [countries])

  <div className ref={ReactDOM.Ref.domRef(selectContainerRef)}>
    <Button
      className={styles["country-select-button"]}
      onClick={() => setIsDropdownOpen(isOpen => !isOpen)}
      ?value
    />
    {isDropdownOpen
      ? <ReactSelect
          ?value
          autoFocus=true
          multi={false}
          options=countries
          menuIsOpen={true}
          styles={customStyles}
          hideSelectedOptions=false
          controlShouldRenderValue={false}
          components={
            option: OptionWithFlag.make,
          }
          filterOption={ReactSelect.createFilter({
            ignoreAccents: true,
            ignoreCase: true,
          })}
          onKeyDown={event => {
            if event.key === "Escape" {
              setIsDropdownOpen(_ => false)
            }
          }}
          onChange={country =>
            switch Js.Nullable.toOption(country) {
            | Some(c) => {
                setValue(_ => Some(c))
                setIsDropdownOpen(_ => false)
                switch onChange {
                | Some(change) => change(c)
                | None => ()
                }
              }

            | _ => ()
            }}
        />
      : <> </>}
  </div>
}
