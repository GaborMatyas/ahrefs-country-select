@deriving(abstract)
type queryOptions<'queryKey, 'queryData, 'queryError, 'pageParam> = {
  @optional queryKey: 'queryKey,
  @optional
  queryFn: ReactQuery_Types.queryFunctionContext<'queryKey, 'pageParam> => Js.Promise.t<'queryData>,
  @optional refetchOnWindowFocus: ReactQuery_Types.boolOrAlwaysValue,
}

type rec queryResult<'queryError, 'queryData> = {
  isError: bool,
  isLoading: bool,
  data: option<'queryData>,
}

@module("react-query")
external useQuery: queryOptions<'queryKey, 'queryData, 'queryError, 'pageParam> => queryResult<
  'queryError,
  'queryData,
> = "useQuery"
