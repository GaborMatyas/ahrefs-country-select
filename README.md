### Manual

To open the language change menu, press "Enter" key or click on the button.

To close the language change menu, press "Esc" key or click outside the list.

To delete the currently selected value, press "Esc" key when the dropdown is closed.

Use mouse scroll or "UP" and "DOWN" arrow keys to navigate inside the list.

Press "Enter" in the list or click on a country to select a value.

## Development

Clone this repository

```sh
git clone https://github.com/GaborMatyas/ahrefs-country-select.git
```

and run

```sh
npm install
```

Run ReScript in dev mode in one terminal tab:

```sh
npm run res:dev
```

In another terminal tab, run the Vite dev server:

```sh
npm run dev
```

Open the localhost with the active port (check Vite output in your terminal)
Example: http://localhost:5173/

### ReScript / Vite Starter Template

This is a Vite-based template with following setup:

- [ReScript](https://rescript-lang.org) 10.1 with @rescript/react and JSX 4 automatic mode
- ES6 modules (ReScript code compiled to `.bs.mjs` files)
- Vite 4 with React Plugin (Fast Refresh)
- Tailwind 3
