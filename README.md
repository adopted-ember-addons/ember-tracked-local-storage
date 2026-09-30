# ember-tracked-local-storage

An addon to allow the use of local storage values to use glimmer tracking and cause template re-renders on updates.

## Compatibility

- Ember.js v4.12 or above
- Embroider or ember-auto-import v2
- Node.js v18 or above

This is a [v2 addon](https://rfcs.emberjs.com/id/0507-embroider-v2-package-format/): it works in classic
ember-cli apps (through ember-auto-import v2) and in Embroider/Vite apps.

## Installation

```
pnpm add ember-tracked-local-storage
```

The `tracked-local-storage` service is re-exported into your app, so it resolves as usual in apps that use
the classic resolver. With a strict resolver (e.g. `ember-strict-application-resolver`), register it yourself:

```js
import TrackedLocalStorageService from 'ember-tracked-local-storage/services/tracked-local-storage';

// in your app's `modules`
'./services/tracked-local-storage': TrackedLocalStorageService,
```

## Usage

Simple use case:
```js
import Component from '@glimmer/component';
import { trackedInLocalStorage } from 'ember-tracked-local-storage';

export default class DemoComponent extends Component {
  @trackedInLocalStorage() someProperty;
}
```

Full guides can be found on the [documentation site](https://adopted-ember-addons.github.io/ember-tracked-local-storage).


## Contributing

See the [Contributing](CONTRIBUTING.md) guide for details.

## License

This project is licensed under the [MIT License](LICENSE.md).
