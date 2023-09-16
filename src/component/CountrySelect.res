@react.component
let make = (~country: string, ~className: string) => {
  <div className=className>
    <Button>
         {React.string(`${country}`)}
    </Button>
  </div>
}
