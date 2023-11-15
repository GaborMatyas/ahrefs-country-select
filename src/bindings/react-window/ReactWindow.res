open Countries

type childRenderProps = {data: array<React.element>, index: int, style: ReactDOM.Style.t}

type innerElementProps = {
  children: React.element,
  style: ReactDOM.Style.t,
}

type listItemInnerProps = {isFocused: bool}

@get external getProps: React.element => listItemInnerProps = "props"

@send
external scrollToItem: (Dom.element, int, [#auto | #smart | #center | #start | #end]) => unit =
  "scrollToItem"

@module("react-window") @react.component
external make: (
  ~children: childRenderProps => React.element,
  ~className: string=?,
  ~estimatedItemSize: int=?,
  ~height: int,
  ~initialScrollOffset: int=?,
  ~innerElementType: React.componentLike<innerElementProps, React.element>=?,
  ~itemCount: int,
  ~itemData: array<React.element>,
  ~itemSize: int => int,
  ~outerRef: ReactDOM.domRef=?,
  ~overscanCount: int=?,
  ~ref: ReactDOM.domRef=?,
  ~itemKey: (int, countries) => string=?,
  ~style: ReactDOM.Style.t=?,
  ~width: string,
) => React.element = "VariableSizeList"
