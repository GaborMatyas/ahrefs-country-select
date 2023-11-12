@module("./CountrySelect.module.css") external styles: {..} = "default"
@send external focus: Dom.element => unit = "focus"

let customStyles = ReactSelect.customStyles(
  ~menuList=provided =>
    ReactDOM.Style.combine(provided, ReactDOM.Style.make(~width="230px", ~height="364px", ())),
  ~control=provided =>
    ReactDOM.Style.combine(
      provided,
      ReactDOM.Style.make(
        ~borderStyle="none",
        ~borderWidth="0",
        ~boxShadow="none",
        ~height="39px",
        (),
      ),
    ),
  ~menu=provided =>
    ReactDOM.Style.combine(
      provided,
      ReactDOM.Style.make(~marginTop="0px", ~borderTopWidth="0", ~boxShadow="none", ()),
    ),
  ~container=provided =>
    ReactDOM.Style.combine(
      provided,
      ReactDOM.Style.make(
        ~borderRadius="2px 2px 0px 0px",
        ~boxShadow="0px 3px 18px 0px rgba(0, 0, 0, 0.15), 0px 0px 0px 1px rgba(0, 0, 0, 0.08)",
        ~minHeight="34px",
        (),
      ),
    ),
  ~option=(provided, state) =>
    ReactDOM.Style.combine(
      provided,
      ReactDOM.Style.make(
        ~backgroundColor=state.isFocused ? "#FFDBB3" : "inherit",
        ~color="#333333",
        ~height="26px",
        ~padding="4px 6px 4px 10px",
        ~display="flex",
        ~alignItems="center",
        (),
      ),
    ),
  (),
)

@react.component
let make = (
  ~country: option<string>,
  ~className: string,
  ~onChange: option<UseCountriesHook.country => unit>=?,
) => {
  let (_isLoading, _error, countries, _signal) = UseCountriesHook.useCountries()

  let (value, setValue) = React.useState(() => None)
  let (isDropdownOpen, setIsDropdownOpen) = React.useState(() => false)

  let selectContainerRef: React.ref<Js.Nullable.t<Dom.element>> = React.useRef(Js.Nullable.null)
  let buttonRef: React.ref<Js.Nullable.t<Dom.element>> = React.useRef(Js.Nullable.null)

  let closeDropdown = () => setIsDropdownOpen(_ => false)
  let giveFocuseToButton = () =>
    buttonRef.current->Js.Nullable.toOption->Belt.Option.forEach(button => button->focus)

  let handleClickOutside = () => {
    closeDropdown()
    giveFocuseToButton()
  }

  let cancelSelection = () => {
    if isDropdownOpen === false {
      setValue(_ => Some(Button.fallbackButtonProps))
    }
  }

  UseClickOutsideHook.useClickOutside(selectContainerRef, handleClickOutside)
  UseCancelSelectionHook.useCancelSelection(cancelSelection)

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

  React.useEffect(() => {
    if isDropdownOpen === false {
      giveFocuseToButton()
    }
    None
  })

  <div className ref={ReactDOM.Ref.domRef(selectContainerRef)}>
    <Button
      className={styles["country-select-button"]}
      onClick={() => setIsDropdownOpen(isOpen => !isOpen)}
      ?value
      buttonRef={ReactDOM.Ref.domRef(buttonRef)}
      autoFocus=true
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
          placeholder={"Search"}
          components={
            option: OptionWithFlag.make,
            menuList: MenuList.getMenuList,
            valueContainer: ValueContainer.make,
            dropdownIndicator: Js.Nullable.null,
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
          onMenuClose={_event => {
            giveFocuseToButton()
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
