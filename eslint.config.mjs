import globals from "globals";
import pluginJs from "@eslint/js";

/** @type {import('eslint').Linter.Config[]} */
export default [
  // Config for all .js files
  {
    files: ["**/*.js"],
    languageOptions: {
      sourceType: "commonjs",
    },
  },

  // Global settings for both browser and Node.js environments
  {
    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node,
      },
    },
  },

  pluginJs.configs.recommended,
];
