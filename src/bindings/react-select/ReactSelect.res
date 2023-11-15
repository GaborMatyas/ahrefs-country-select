open Countries

type options = array<country>

@module("react-select") external components: {..} = "components"

module ReactSelectOption = {
  type reactSelectOptionProps = {children?: option<React.element>, label: string, value: string}
  let optionComponent: reactSelectOptionProps => React.element = components["Option"]

  let make = (props: reactSelectOptionProps) => {
    <> {React.createElement(optionComponent, props)} </>
  }
}

module ReactSelectMenuList = {
  type reactSelectMenuListProps = {children: React.element}
  let menuListComponent: reactSelectMenuListProps => React.element = components["MenuList"]

  let make = (props: reactSelectMenuListProps) => {
    <> {React.createElement(menuListComponent, props)} </>
  }
}

module ReactSelectValueContainer = {
  type rec reactSelectValueContainerProps = {
    children: React.element,
    getStyles: (string, reactSelectValueContainerProps) => ReactDOM.Style.t,
  }
  let valueContainerComponent: reactSelectValueContainerProps => React.element = components["ValueContainer"]

  let make = (props: reactSelectValueContainerProps) => {
    <> {React.createElement(valueContainerComponent, props)} </>
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
  @as("MenuList") menuList?: ReactSelectMenuList.reactSelectMenuListProps => React.element,
  @as("ValueContainer")
  valueContainer?: ReactSelectValueContainer.reactSelectValueContainerProps => React.element,
  @as("DropdownIndicator")
  dropdownIndicator?: Js.Nullable.t<React.component<{.}>>,
}

type componentState = {isFocused: bool, isHovered: bool}
type onKeyDown = KeyDownModel.keyDownEvent => unit
type customComponentStyles = ReactDOM.Style.t => ReactDOM.Style.t
type customComponentStylesWithState = (ReactDOM.Style.t, componentState) => ReactDOM.Style.t

@deriving(abstract)
type customStyles = {
  @optional
  option: customComponentStylesWithState,
  @optional
  menuList: customComponentStyles,
  @optional
  menu: customComponentStyles,
  @optional
  control: customComponentStyles,
  @optional
  container: customComponentStyles,
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
  ~onMenuClose: Js.Nullable.t<'a> => unit,
  ~options: options,
  ~placeholder: string=?,
  ~onKeyDown: onKeyDown=?,
  ~styles: customStyles=?,
  ~value: country=?,
) => React.element = "default"
