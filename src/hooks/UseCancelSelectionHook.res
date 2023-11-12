@scope("document") @val
external addDocumentEventListener: (string, KeyDownModel.keyDownEvent => unit) => unit =
  "addEventListener"
@scope("document") @val
external removeDocumentEventListener: (string, KeyDownModel.keyDownEvent => unit) => unit =
  "removeEventListener"

let useCancelSelection = callback => {
  let handleDeletePress = (event: KeyDownModel.keyDownEvent) => {
    if event.key === "Escape" {
      callback()
    }
  }

  React.useEffect1(() => {
    addDocumentEventListener("keydown", handleDeletePress)

    Some(
      () => {
        removeDocumentEventListener("keydown", handleDeletePress)
      },
    )
  }, [])

  ()
}
