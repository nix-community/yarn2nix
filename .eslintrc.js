module.exports = {
  parser: 'babel-eslint',
  extends: [
    'airbnb',
    'standard',
    'prettier',
    'prettier/standard',
    'plugin:promise/recommended',
    'plugin:import/errors',
  ],
  plugins: ['import'],
  rules: {
    'no-unused-vars': [
      'error',
      {
        argsIgnorePattern: '^_',
        varsIgnorePattern: '^_',
      },
    ],

    // style --------------------------------
    'comma-dangle': [
      'error',
      {
        arrays: 'always-multiline',
        objects: 'always-multiline',
        imports: 'always-multiline',
        exports: 'always-multiline',
        functions: 'always-multiline',
      },
    ],
    'no-multi-spaces': [
      'error',
      {
        exceptions: {
          Property: true,
          ImportDeclaration: true,
        },
      },
    ],
    'key-spacing': [
      'error',
      {
        mode: 'strict',
        align: 'value',
      },
    ],

    // because of error https://github.com/eslint/eslint/issues/9734#issuecomment-352591878
    'prefer-destructuring': ['warn'],

    // other --------------------------------
    'no-console': 'off',
    'import/prefer-default-export': ['warn'],
    'no-underscore-dangle': ['off'],
    'node/no-unsupported-features': ['off'],
  },
}
