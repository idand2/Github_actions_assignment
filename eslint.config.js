    const globals = require('globals');

    module.exports = [
      // ... other configurations
      {
        languageOptions: {
          globals: {
            ...globals.node
          }
        }
      }
    ];