//import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'


export default function defineConfig({ command }) {
  const isDev = command !== "build";
  if (isDev) {
    // Terminate the watcher when Phoenix quits
    process.stdin.on("close", () => {
      process.exit(0);
    });

    process.stdin.resume();
  }

  return {
    root: './',
    publicDir: "./src/assets",
    plugins: [vue()],
    build: {
      target: "esnext", // build for recent browsers
      outDir: "../priv/static/src/assets", // emit assets to priv/static
      emptyOutDir: true,
      sourcemap: isDev, // enable source map in dev build
      manifest: false, // do not generate manifest.json
      rollupOptions: {
        input: {
          main: "./src/main.js"
        },
        output: {
          entryFileNames: "assets/[name].js", // remove hash
          chunkFileNames: "assets/[name].js",
          assetFileNames: "assets/[name][extname]"
        }
      }
    }
  };
};
