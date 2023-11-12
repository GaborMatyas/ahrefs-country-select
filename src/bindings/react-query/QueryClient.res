exception QueryClientError(Fetch.Response.t)

let validateRequestError = response => {
  switch response->Fetch.Response.status {
  | 401 => ()
  | _ => ()
  }
  switch response->Fetch.Response.ok {
  | false => Promise.reject(QueryClientError(response))
  | true => Promise.resolve(response)
  }
}

let get = (~signal=?, ~url) => {
  open Promise

  Fetch.fetch(
    `${url}`,
    {
      method: #GET,
      ?signal,
    },
  )
  ->then(validateRequestError)
  ->then(response => Fetch.Response.json(response))
}
