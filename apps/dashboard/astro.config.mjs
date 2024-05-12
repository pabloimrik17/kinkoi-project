import { codecovVitePlugin } from "@codecov/vite-plugin";
import { defineConfig } from "astro/config";

// https://astro.build/config
export default defineConfig({
    // Enable for SSR
    // output: "server",
    vite: {
        plugins: [
            // Put the Codecov vite plugin after all other plugins
            codecovVitePlugin({
                enableBundleAnalysis: process.env.CODECOV_TOKEN !== undefined,
                bundleName: "@kinkoi/dashboard",
                uploadToken: process.env.CODECOV_TOKEN,
            }),
        ],
    },
    // Enable for SSR
    // adapter: node({
    //    mode: "standalone",
    // }),
});
