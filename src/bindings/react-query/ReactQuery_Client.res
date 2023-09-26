type queryClientValue

type queryClient<'queryKey, 'queryData, 'queryError, 'pageParams> = {}

@module("react-query")
external useQueryClient: unit => queryClient<'queryKey, 'queryData, 'queryError, 'pageParams> =
  "useQueryClient"

module Provider = {
  @new @module("react-query")
  external createClient: unit => queryClientValue = "QueryClient"

  @module("react-query") @react.component
  external make: (
    ~client: queryClientValue,
    ~contextSharing: bool=?,
    ~children: React.element,
  ) => React.element = "QueryClientProvider"
}
