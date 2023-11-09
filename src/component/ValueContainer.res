@module("./ValueContainer.module.css") external styles: {..} = "default"

let make = (props: ReactSelect.ReactSelectValueContainer.reactSelectValueContainerProps) => {
  <div className={styles["value-container-wrapper"]}>
    <div className={styles["search-bar"]}>
      <MagnifierIcon className={styles["magnifierIcon"]} />
      {ReactSelect.ReactSelectValueContainer.make(props)}
    </div>
    <div className={styles["divider"]} />
  </div>
}
