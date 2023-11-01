let make = (props: ReactSelect.ReactSelectOption.reactSelectOptionProps) => {
  let children = Some(<>
    <FlagIcon country={props.value} />
    <span className={"overflow-hidden text-ellipsis whitespace-nowrap ml-2"}>
      {props.label->React.string}
    </span>
  </>)
  <ReactSelect.ReactSelectOption {...props}> {children} </ReactSelect.ReactSelectOption>
}
