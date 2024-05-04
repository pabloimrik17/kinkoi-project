import { codecovVitePlugin } from "@codecov/vite-plugin";
import { defineConfig } from "astro/config";

import node from "@astrojs/node";

// https://astro.build/config
export default defineConfig({
    output: "server",
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
    adapter: node({
        mode: "standalone",
    }),
});
