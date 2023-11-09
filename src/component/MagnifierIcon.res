@react.component
let make = (~className: option<string>=?) => {
  <svg
    ?className
    xmlns="http://www.w3.org/2000/svg"
    width="14"
    height="14"
    fill="none"
    viewBox="0 0 14 14">
    <path
      fill="#333"
      fillRule="evenodd"
      d="M6 11c1.02 0 1.967-.305 2.758-.829l3.302 3.299 1.41-1.41-3.299-3.302A5 5 0 106 11zm3.2-5a3.2 3.2 0 11-6.4 0 3.2 3.2 0 016.4 0z"
      clipRule="evenodd"
    />
  </svg>
}
