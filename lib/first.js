// @flow

// This is the same as `head` and `first` from Lodash, copied here to avoid
// bringing in lodash and all its dependencies.
// https://github.com/lodash/lodash/blob/4.17.5/lodash.js#L7415

module.exports = /*:: <T> */ (array /*: ?Array<T> */) /*: ?T */ =>
  array && array.length ? array[0] : undefined;
