import globals from "globals";
import js from "@eslint/js";

export default [
    {languageOptions: { globals: globals.node } },
  js.configs.recommended,
  {
    // Your custom configurations or overrides if neeeded. 
  },
];
