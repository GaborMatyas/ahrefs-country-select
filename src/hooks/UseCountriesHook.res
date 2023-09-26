let queryKey = `countries`
let apiUrl = "https://gist.githubusercontent.com/rusty-key/659db3f4566df459bd59c8a53dc9f71f/raw/4127f9550ef063121c564025f6d27dceeb279623/counties.json"

@decco
type country = {
  label: string,
  value: string,
}

@decco
type countries = array<country>

type hookResult =
  | Data(countries)
  | Loading
  | Empty
  | Error
  | DecodeError

let {useQuery, queryOptions} = module(ReactQuery)

let handleFetch = _ => {
  open Promise
  QueryClient.get(~url=`${apiUrl}`)->thenResolve(countries_decode)
}

let useCountries = () => {
  let fetchResult = useQuery(
    queryOptions(
      ~queryKey,
      ~refetchOnWindowFocus=ReactQuery_Utils.refetchOnWindowFocus(#bool(false)),
      ~queryFn=_ => handleFetch(),
      (),
    ),
  )

  switch fetchResult {
  | {isLoading: true} => Loading
  | {isError: true} => Error
  | {data: Some(Error(_))} => DecodeError
  | {data: Some(Ok(data))} => Data(data)
  | _ => Empty
  }
}
