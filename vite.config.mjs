import { defineConfig } from 'vite';
import { extensions, ember, classicEmberSupport } from '@embroider/vite';
import { babel } from '@rollup/plugin-babel';

// For scenario testing
const isCompat = Boolean(process.env.ENABLE_COMPAT_BUILD);

// A production build is the docs site (index.html + demo-app/) for GitHub
// Pages, which serves it from /ember-tracked-local-storage/; tests always
// build in development mode.
export default defineConfig(({ mode }) => ({
  base: mode === 'production' ? '/ember-tracked-local-storage/' : '/',
  plugins: [
    ...(isCompat ? [classicEmberSupport()] : []),
    ember(),
    babel({
      babelHelpers: 'inline',
      extensions,
    }),
  ],
  build: {
    rollupOptions: {
      input: mode === 'production' ? undefined : { tests: 'tests/index.html' },
    },
  },
}));
