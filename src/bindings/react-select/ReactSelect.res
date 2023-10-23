type options = array<UseCountriesHook.country>

@module("react-select") external components: {..} = "components"

module ReactSelectOption = {
  type reactSelectOptionProps = {children?: option<React.element>, label: string, value: string}
  let optionComponent: reactSelectOptionProps => React.element = components["Option"]

  let make = (props: reactSelectOptionProps) => {
    <> {React.createElement(optionComponent, props)} </>
  }
}

type filterConfig = {
  ignoreCase: bool,
  ignoreAccents: bool,
}

type filterOption
@module("react-select") @val
external createFilter: filterConfig => filterOption = "createFilter"

type components<'a> = {
  @as("Option") option?: ReactSelectOption.reactSelectOptionProps => React.element,
}

type componentState = {isFocused: bool}
type keyDownEvent = {which: int, key: string}
type onKeyDown = keyDownEvent => unit

@deriving(abstract)
type customStyles = {
  @optional
  option: (ReactDOM.Style.t, componentState) => ReactDOM.Style.t,
}

@module("react-select") @react.component
external make: (
  ~autoFocus: bool=?,
  ~components: components<'a>=?,
  ~controlShouldRenderValue: bool=?,
  ~filterOption: filterOption=?,
  ~hideSelectedOptions: bool=?,
  ~menuIsOpen: bool=?,
  ~multi: bool=?,
  ~onChange: Js.Nullable.t<'a> => unit,
  ~options: options,
  ~placeholder: string=?,
  ~onKeyDown: onKeyDown=?,
  ~styles: customStyles=?,
  ~value: UseCountriesHook.country=?,
) => React.element = "default"
