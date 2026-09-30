import EmberApp from 'ember-strict-application-resolver';
import EmberRouter from '@ember/routing/router';
import PageTitleService from 'ember-page-title/services/page-title';
import TrackedLocalStorageService from '#src/services/tracked-local-storage.js';

class Router extends EmberRouter {
  // Hash URLs, so every docs page can be linked to on GitHub Pages without a
  // server-side fallback. `rootURL` follows Vite's `base` (see vite.config.mjs).
  location = 'hash';
  rootURL = import.meta.env.BASE_URL;
}

export class App extends EmberApp {
  /**
   * Any services or anything from the addon that needs to be in the app-tree registry
   * will need to be manually specified here.
   *
   * Techniques to avoid needing this:
   * - private services
   * - require the consuming app import and configure themselves
   *   (which is what we're emulating here)
   */
  modules = {
    './router': Router,
    './services/page-title': PageTitleService,
    './services/tracked-local-storage': TrackedLocalStorageService,
    /**
     * These imports are not magic, but we do require that all entries in the
     * modules object match a ./[type]/[name] pattern.
     *
     * See: https://rfcs.emberjs.com/id/1132-default-strict-resolver
     */
    ...import.meta.glob('./templates/**/*', { eager: true }),
  };
}

Router.map(function () {
  this.route('installation');
  this.route('how-to-use-it');
  this.route('service-class');
  this.route('global-prefixes');
  this.route('tracked-in-local-storage-api');
  this.route('tracked-local-storage-service-api');
});
