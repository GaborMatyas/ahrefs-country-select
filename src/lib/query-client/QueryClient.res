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

let get = (~url) => {
  open Promise

  Fetch.fetch(
    `${url}`,
    {
      "method": "GET",
    },
  )
  ->then(validateRequestError)
  ->then(response => Fetch.Response.json(response))
}
