let boolOrAlways = value =>
  switch value {
  | #bool(value) => Obj.magic(value)
  | #always => Obj.magic(#always)
  }

let refetchOnWindowFocus = boolOrAlways
