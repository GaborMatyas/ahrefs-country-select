// Generated by ReScript, PLEASE EDIT WITH CARE

import * as ReactQuery from "react-query";
import * as CountrySelect from "./component/CountrySelect.bs.mjs";
import * as JsxRuntime from "react/jsx-runtime";

var queryClient = new ReactQuery.QueryClient();

function App(props) {
  return JsxRuntime.jsx(ReactQuery.QueryClientProvider, {
              client: queryClient,
              children: JsxRuntime.jsx("div", {
                    children: JsxRuntime.jsx(CountrySelect.make, {
                          country: "us",
                          className: "w-[230px]",
                          onChange: (function (country) {
                              console.log(country);
                            })
                        }),
                    className: "h-screen-dvh w-screen-dvh flex justify-center pt-32"
                  })
            });
}

var make = App;

export {
  queryClient ,
  make ,
}
/* queryClient Not a pure module */
