// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Button from "./Button.bs.mjs";
import * as MenuList from "./MenuList.bs.mjs";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import ReactSelect from "react-select";
import * as ReactSelect$1 from "react-select";
import * as OptionWithFlag from "./OptionWithFlag.bs.mjs";
import * as ValueContainer from "./ValueContainer.bs.mjs";
import * as UseCountriesHook from "../hooks/UseCountriesHook.bs.mjs";
import * as JsxRuntime from "react/jsx-runtime";
import * as UseClickOutsideHook from "../hooks/UseClickOutsideHook.bs.mjs";
import CountrySelectModuleCss from "./CountrySelect.module.css";

var styles = CountrySelectModuleCss;

var customStyles = {
  option: (function (provided, state) {
      return Object.assign({}, provided, {
                  backgroundColor: state.isFocused ? "#FFDBB3" : "inherit",
                  color: "#333333",
                  display: "flex",
                  height: "26px",
                  padding: "4px 6px 4px 10px",
                  alignItems: "center"
                });
    }),
  menuList: (function (provided) {
      return Object.assign({}, provided, {
                  height: "364px",
                  width: "230px"
                });
    }),
  menu: (function (provided) {
      return Object.assign({}, provided, {
                  borderTopWidth: "0",
                  marginTop: "0px",
                  boxShadow: "none"
                });
    }),
  control: (function (provided) {
      return Object.assign({}, provided, {
                  borderStyle: "none",
                  borderWidth: "0",
                  height: "39px",
                  boxShadow: "none"
                });
    }),
  container: (function (provided) {
      return Object.assign({}, provided, {
                  minHeight: "34px",
                  borderRadius: "2px 2px 0px 0px",
                  boxShadow: "0px 3px 18px 0px rgba(0, 0, 0, 0.15), 0px 0px 0px 1px rgba(0, 0, 0, 0.08)"
                });
    })
};

function CountrySelect(props) {
  var onChange = props.onChange;
  var country = props.country;
  var match = UseCountriesHook.useCountries(undefined);
  var countries = match[2];
  var match$1 = React.useState(function () {
        
      });
  var setValue = match$1[1];
  var value = match$1[0];
  var match$2 = React.useState(function () {
        return false;
      });
  var setIsDropdownOpen = match$2[1];
  var isDropdownOpen = match$2[0];
  var selectContainerRef = React.useRef(null);
  var buttonRef = React.useRef(null);
  var giveFocuseToButton = function (param) {
    Belt_Option.forEach(Caml_option.nullable_to_opt(buttonRef.current), (function (button) {
            button.focus();
          }));
  };
  var handleClickOutside = function (param) {
    Curry._1(setIsDropdownOpen, (function (param) {
            return false;
          }));
    giveFocuseToButton(undefined);
  };
  UseClickOutsideHook.useClickOutside(selectContainerRef, handleClickOutside);
  React.useEffect((function () {
          var value = country !== undefined ? Belt_Array.getByU(countries, (function (countryListItem) {
                    return countryListItem.value.toLowerCase() === country.toLowerCase();
                  })) : undefined;
          Curry._1(setValue, (function (param) {
                  return value;
                }));
        }), [countries]);
  React.useEffect(function () {
        if (isDropdownOpen === false) {
          giveFocuseToButton(undefined);
        }
        
      });
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsx(Button.make, {
                      className: styles["country-select-button"],
                      value: value,
                      onClick: (function (param) {
                          Curry._1(setIsDropdownOpen, (function (isOpen) {
                                  return !isOpen;
                                }));
                        }),
                      autoFocus: true,
                      buttonRef: buttonRef
                    }),
                isDropdownOpen ? JsxRuntime.jsx(ReactSelect, {
                        autoFocus: true,
                        components: {
                          Option: OptionWithFlag.make,
                          MenuList: MenuList.getMenuList,
                          ValueContainer: ValueContainer.make,
                          DropdownIndicator: null
                        },
                        controlShouldRenderValue: false,
                        filterOption: Caml_option.some(ReactSelect$1.createFilter({
                                  ignoreCase: true,
                                  ignoreAccents: true
                                })),
                        hideSelectedOptions: false,
                        menuIsOpen: true,
                        multi: false,
                        onChange: (function (country) {
                            if (!(country == null)) {
                              Curry._1(setValue, (function (param) {
                                      return country;
                                    }));
                              Curry._1(setIsDropdownOpen, (function (param) {
                                      return false;
                                    }));
                              if (onChange !== undefined) {
                                return Curry._1(onChange, country);
                              } else {
                                return ;
                              }
                            }
                            
                          }),
                        onMenuClose: (function (_event) {
                            giveFocuseToButton(undefined);
                          }),
                        options: countries,
                        placeholder: "Search",
                        onKeyDown: (function ($$event) {
                            if ($$event.key === "Escape") {
                              return Curry._1(setIsDropdownOpen, (function (param) {
                                            return false;
                                          }));
                            }
                            
                          }),
                        styles: Caml_option.some(customStyles),
                        value: value
                      }) : JsxRuntime.jsx(JsxRuntime.Fragment, {})
              ],
              ref: Caml_option.some(selectContainerRef),
              className: props.className
            });
}

var make = CountrySelect;

export {
  styles ,
  customStyles ,
  make ,
}
/* styles Not a pure module */
