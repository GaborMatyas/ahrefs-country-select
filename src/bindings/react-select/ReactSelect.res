type options = array<UseCountriesHook.country>

@module("react-select") external components: {..} = "components"

module ReactSelectOption = {
  type reactSelectOptionProps = {children?: option<React.element>, label: string, value: string}
  let optionComponent: reactSelectOptionProps => React.element = components["Option"]

  let make = (props: reactSelectOptionProps) => {
    <> {React.createElement(optionComponent, props)} </>
  }
}

type components<'a> = {
  @as("Option") option?: ReactSelectOption.reactSelectOptionProps => React.element,
}

@module("react-select") @react.component
external make: (
  ~defaultInputValue: string,
  ~options: options,
  ~autoFocus: bool=?,
  ~components: components<'a>=?,
  ~placeholder: string=?,
) => React.element = "default"
