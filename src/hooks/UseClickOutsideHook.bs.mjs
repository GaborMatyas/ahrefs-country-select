// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";

var isEventFromOutside = (function (event, elementRef) {

    return event.target && event.target.contains(elementRef.current)

  });

var DomEvent = {
  isEventFromOutside: isEventFromOutside
};

function useClickOutside(elementRef, callback) {
  var handleClickOutside = function ($$event) {
    var isFromInsideElement = isEventFromOutside($$event, elementRef);
    var _domElement = elementRef.current;
    if (!(_domElement == null) && isFromInsideElement) {
      return Curry._1(callback, undefined);
    }
    
  };
  React.useEffect((function () {
          document.addEventListener("click", handleClickOutside);
          return (function (param) {
                    document.removeEventListener("click", handleClickOutside);
                  });
        }), []);
}

export {
  DomEvent ,
  useClickOutside ,
}
/* react Not a pure module */
