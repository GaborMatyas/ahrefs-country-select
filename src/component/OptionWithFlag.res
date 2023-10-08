let make = (props: ReactSelect.ReactSelectOption.reactSelectOptionProps) => {
  let children = Some(<>
    <FlagIcon country={props.value} />
    {props.label->React.string}
  </>)
  <ReactSelect.ReactSelectOption {...props}> {children} </ReactSelect.ReactSelectOption>
}
