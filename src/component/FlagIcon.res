%%raw(`import '../../node_modules/flag-icon-css/css/flag-icons.min.css'`)

@module("./FlagIcon.module.css") external styles: {..} = "default"

@react.component
let make = (~country: string) => {
  <span className={`flag-icon flag-icon-${country} ${styles["flagIcon"]}`} />
}
