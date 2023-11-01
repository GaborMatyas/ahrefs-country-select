@module("./MenuList.module.css") external styles: {..} = "default"
let defaultItemHeight = 26
let renderedElementCountOutsideVisibleArea = 3

let getFocusedIndex = (rows: array<React.element>) => {
  rows
  ->Belt.Array.getIndexByU((. listItem) => ReactWindow.getProps(listItem).isFocused)
  ->Belt.Option.getWithDefault(0)
}

let getMenuList = (props: ReactSelect.ReactSelectMenuList.reactSelectMenuListProps) => {
  let items = React.useMemo1(() => React.Children.toArray(props.children), [props.children])
  let focusedIndex = React.useMemo1(() => getFocusedIndex(items), [items])
  let listRef = React.useRef(Js.Nullable.null)

  React.useEffect3(() => {
    switch Js.Nullable.toOption(listRef.current) {
    | Some(list) =>
      if focusedIndex >= 0 {
        ReactWindow.scrollToItem(list, focusedIndex, #smart)
      }
    | None => ()
    }
    None
  }, (focusedIndex, items, listRef))

  <ReactWindow
    className={styles["no-scrollbar"]}
    width={"100%"}
    height={364}
    itemCount={items->Array.length}
    estimatedItemSize={defaultItemHeight}
    initialScrollOffset={0} //OK
    innerElementType={(props: ReactWindow.innerElementProps) => {
      <div> {props.children} </div>
    }}
    itemSize={_ => defaultItemHeight}
    itemData={items}
    overscanCount={renderedElementCountOutsideVisibleArea}
    ref={ReactDOM.Ref.domRef(listRef)}>
    {({data, index, style}) => {
      <div key={string_of_int(index)} style>
        {switch data[index] {
        | Some(elementData) => elementData
        | None => <> </>
        }}
      </div>
    }}
  </ReactWindow>
}
