import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { fillIn, render, settled } from '@ember/test-helpers';
import Component from '@glimmer/component';
import { Input } from '@ember/component';
import { trackedInLocalStorage } from '#src/utils/tracked-in-local-storage.js';

const TEST_DEFAULT_VALUE = 'test default value';
const TEST_KEY_NAME = 'test-key-name';

class TestComponent extends Component {
  @trackedInLocalStorage({
    defaultValue: TEST_DEFAULT_VALUE,
    keyName: TEST_KEY_NAME,
  })
  testValue;

  <template>
    <div data-test-value>
      {{this.testValue}}
    </div>

    <Input data-test-value-input @value={{this.testValue}} />
  </template>
}

const page = {
  value: '[data-test-value]',
  input: '[data-test-value-input]',
};

function renderTestComponent() {
  return render(<template><TestComponent /></template>);
}

module('Integration | tracked local storage', function (hooks) {
  setupRenderingTest(hooks);

  let trackedLocalStorage;

  hooks.beforeEach(function () {
    trackedLocalStorage = this.owner.lookup('service:tracked-local-storage');
    trackedLocalStorage.clear();
  });

  test('basic getting and updating works and causes a template rerender', async function (assert) {
    const updatedValue = 'updated value';

    await renderTestComponent();

    assert
      .dom(page.value)
      .hasText(TEST_DEFAULT_VALUE, 'it display default text');
    assert.notOk(
      trackedLocalStorage.getItem(TEST_KEY_NAME),
      'value is not stored in local storage when default value is being used',
    );

    await fillIn(page.input, updatedValue);

    assert
      .dom(page.value)
      .hasText(
        updatedValue,
        'the template has been rerendered with the updated text',
      );
    assert.strictEqual(
      trackedLocalStorage.getItem(TEST_KEY_NAME),
      updatedValue,
      'value is stored in local storage when different to default value',
    );
  });

  test('updating a global prefix correctly triggers a template rerender', async function (assert) {
    const testPrefixName = 'test-prefix-name';
    const updatedValue = 'updated value';
    trackedLocalStorage.setGlobalPrefix(testPrefixName, 1);

    await renderTestComponent();
    await fillIn(page.input, updatedValue);

    assert
      .dom(page.value)
      .hasText(updatedValue, 'it shows the updated value when prefix matches');

    trackedLocalStorage.setGlobalPrefix(testPrefixName, 2);
    await settled();

    assert
      .dom(page.value)
      .hasText(
        TEST_DEFAULT_VALUE,
        'it reverts back to showing the default value when the prefix value changes',
      );
  });

  test('removing a key reverts a value back to the default value triggers a template rerender', async function (assert) {
    const updatedValue = 'updated value';

    await renderTestComponent();
    await fillIn(page.input, updatedValue);

    assert.dom(page.value).hasText(updatedValue, 'it shows the updated value');

    trackedLocalStorage.removeItem(TEST_KEY_NAME);
    await settled();

    assert
      .dom(page.value)
      .hasText(
        TEST_DEFAULT_VALUE,
        'it reverts back to showing the default value when the key is removed',
      );
  });
});
