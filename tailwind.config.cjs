/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html", "./src/**/*.bs.mjs"],
  theme: {
    extend: {
      height: {
        'screen-dvh': [
          '100vh',
          '100dvh'
        ],
      },
      width: {
        'screen-dvw': [
          '100vw',
          '100dvw'
        ],
      },
    },
  },
  plugins: [],
};
