import eslint from '@eslint/js';
import globals from 'globals';
import tseslint from 'typescript-eslint';
import { globalIgnores } from 'eslint/config';

export default tseslint.config(
  globalIgnores(['**/dist/**', 'node_modules/**', '**/vite.config.js', '**/vite.config.d.ts']),
  eslint.configs.recommended,
  ...tseslint.configs.recommended,
  {
    ignores: ['eslint.config.js'],
    languageOptions: {
      globals: { ...globals.node, ...globals.browser },
      parserOptions: { projectService: true },
    },
  },
);
