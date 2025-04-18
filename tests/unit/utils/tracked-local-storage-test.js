import TrackedLocalStorage from 'ember-tracked-local-storage/utils/tracked-local-storage';
import { module, test } from 'qunit';

/* eslint-disable max-lines-per-function */
module('Unit | Utility | tracked local storage', function (hooks) {
  let trackedLocalStorage;
  const testKey = 'test-key';
  const testValue = 'test-value';

  hooks.beforeEach(async function () {
    trackedLocalStorage = new TrackedLocalStorage();
    trackedLocalStorage.clear();
  });

  test('it sets and gets a string item properly', function (assert) {
    trackedLocalStorage.setItem(testKey, testValue);

    assert.strictEqual(
      trackedLocalStorage.getItem(testKey),
      testValue,
      'it set the item properly',
    );
  });

  test('it sets and gets a boolean item properly', function (assert) {
    trackedLocalStorage.setItem(testKey, true);

    assert.true(
      trackedLocalStorage.getItem(testKey),
      'it set the item properly',
    );
  });

  test('it removes an item properly', function (assert) {
    trackedLocalStorage.setItem(testKey, testValue);
    trackedLocalStorage.removeItem(testKey);

    assert.strictEqual(
      trackedLocalStorage.getItem(testKey),
      null,
      'it returns null when getting a removed item',
    );
  });

  test('it returns the correct length of items in storage', function (assert) {
    trackedLocalStorage.setItem('1', testValue);
    trackedLocalStorage.setItem('2', testValue);

    assert.strictEqual(
      trackedLocalStorage.length,
      2,
      'it returns correct amount of items',
    );

    trackedLocalStorage.setItem('3', testValue);

    assert.strictEqual(
      trackedLocalStorage.length,
      3,
      'it returns correct amount of items',
    );
  });

  test('it returns the correct key', function (assert) {
    trackedLocalStorage.setItem(testKey, testValue);

    assert.strictEqual(
      trackedLocalStorage.key(0),
      testKey,
      'it returns the correct value of the index passed in',
    );
  });

  test('it clears all items properly', function (assert) {
    trackedLocalStorage.setItem('1', testValue);
    trackedLocalStorage.setItem('2', testValue);
    trackedLocalStorage.clear();

    assert.strictEqual(
      trackedLocalStorage.getItem('1'),
      null,
      'first cell has been removed',
    );
    assert.strictEqual(
      trackedLocalStorage.getItem('2'),
      null,
      'second cell has been removed',
    );
    assert.strictEqual(trackedLocalStorage.length, 0, 'length is 0');
  });
});
