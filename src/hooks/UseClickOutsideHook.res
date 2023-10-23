@scope("document") @val
external addDocumentEventListener: (string, unit => unit) => unit = "addEventListener"
@scope("document") @val
external removeDocumentEventListener: (string, unit => unit) => unit = "removeEventListener"

module DomEvent = {
  let isEventFromOutside = %raw(`function (event, elementRef) {

    return event.target && event.target.contains(elementRef.current)

  }`)
}

let useClickOutside = (elementRef: React.ref<Js.Nullable.t<Dom.element>>, callback) => {
  let handleClickOutside = event => {
    let isFromInsideElement = event->DomEvent.isEventFromOutside(elementRef)

    switch Js.Nullable.toOption(elementRef.current) {
    | Some(_domElement) =>
      if isFromInsideElement {
        callback()
      }
    | None => ()
    }
  }

  React.useEffect1(() => {
    addDocumentEventListener("click", handleClickOutside)

    Some(
      () => {
        removeDocumentEventListener("click", handleClickOutside)
      },
    )
  }, [])

  ()
}
