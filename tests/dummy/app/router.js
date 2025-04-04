import EmberRouter from '@ember/routing/router';
import config from 'dummy/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('global-prefixes');
  this.route('how-to-use-it');
  this.route('installation');
  this.route('service-class');
  this.route('tracked-in-local-storage-api');
  this.route('tracked-local-storage-service-api');
});
