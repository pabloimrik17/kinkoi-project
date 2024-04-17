import { defineConfig } from "astro/config";
import { codecovVitePlugin } from "@codecov/vite-plugin";

// https://astro.build/config
export default defineConfig({
  vite: {
    plugins: [
      // Put the Codecov vite plugin after all other plugins
      codecovVitePlugin({
        enableBundleAnalysis: process.env.CODECOV_TOKEN !== undefined,
        bundleName: "@kinkoi/dashboard",
        uploadToken: process.env.CODECOV_TOKEN,
      }),
    ]
  },
});
