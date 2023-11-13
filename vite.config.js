import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [
    react({
      include: ["**/*.bs.mjs"],
      exclude: ["decco/*/*.bs.mjs"],
    }),
  ],
  build: {
    rollupOptions: {
      external: ["decco/src/Decco.bs.mjs"],
    },
  },
});
