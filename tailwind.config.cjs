/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html", "./src/**/*.bs.mjs"],
  theme: {
    colors: {
      lightTextPrimary: "#333333",
      lightBorderControlAlpha: "rgba(0, 0, 0, 0.20)",
      lightBorderLineAlpha: "rgba(0, 0, 0, 0.20)",
      lightBackgroundSelected: "#FFDBB3",
    },
    extend: {
      height: {
        "screen-dvh": ["100vh", "100dvh"],
      },
      width: {
        "screen-dvw": ["100vw", "100dvw"],
      },
    },
  },
  plugins: [],
};
