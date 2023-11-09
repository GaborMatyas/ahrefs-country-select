@module("./ValueContainer.module.css") external styles: {..} = "default"

let make = (props: ReactSelect.ReactSelectValueContainer.reactSelectValueContainerProps) => {
  <div className={styles["value-container-wrapper"]}>
    <MagnifierIcon className={styles["magnifierIcon"]} />
    {ReactSelect.ReactSelectValueContainer.make(props)}
  </div>
}
