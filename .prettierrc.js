module.exports = {
  semi: false,
  singleQuote: true,
  trailingComma: 'es5',
  tabWidth: 2,
  overrides: [
    {
      files: ['*.js', '*.jsx'],
      options: {
        parser: 'babylon',
      },
    },
    {
      files: ['*.ts', '*.tsx'],
      options: {
        parser: 'typescript',
      },
    },
    {
      files: ['*.json', '*.yml', '*.yaml'],
      options: {
        parser: 'json',
      },
    },
    {
      files: ['*.gql', '*.graphql'],
      options: {
        parser: 'graphql',
      },
    },
  ],
}
