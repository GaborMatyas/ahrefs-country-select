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
  | Error

let {useQuery, queryOptions} = module(ReactQuery)

let handleFetch = (~signal) => {
  open Promise
  QueryClient.get(~url=`${apiUrl}`, ~signal)->thenResolve(countries_decode)
}

type state = {
  isLoading: bool,
  error: string,
  countries: countries,
}

let initialState = {
  isLoading: false,
  error: "",
  countries: [],
}

type action =
  | Loading
  | Error(string)
  | SuccessCountries(countries)

let reducer = (state: state, action: action) => {
  switch action {
  | Loading => {
      isLoading: true,
      error: "",
      countries: state.countries,
    }
  | Error(msg) => {
      isLoading: false,
      error: msg,
      countries: state.countries,
    }
  | SuccessCountries(countries) => {
      isLoading: false,
      error: "",
      countries,
    }
  }
}

let useCountries = () => {
  let (state, dispatch) = React.useReducer(reducer, initialState)

  let controller = Fetch.AbortController.make()
  let signal = Fetch.AbortController.signal(controller)

  let fetchResult = useQuery(
    queryOptions(
      ~queryKey,
      ~refetchOnWindowFocus=ReactQuery_Utils.refetchOnWindowFocus(#bool(false)),
      ~queryFn=_ => handleFetch(~signal),
      (),
    ),
  )

  React.useEffect1(() => {
    switch fetchResult {
    | {isLoading: true} => dispatch(Loading)
    | {isError: true} => dispatch(Error("Error while fetching countries from server"))
    | {data: Some(Ok(data))} => dispatch(SuccessCountries(data))
    | _ => dispatch(SuccessCountries([]))
    }

    None
  }, [fetchResult.isLoading])

  (state.isLoading, state.error, state.countries, signal)
}
