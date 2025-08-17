const axios = require('axios');

describe('Health Check Endpoint (/health)', () => {
  // HTTP requests are asynchronous.
  test('should respond with status 200 and the text "Still working"', async () => {
    const url = 'http://localhost:3000/health';

    try {
      const response = await axios.get(url);

      expect(response.status).toBe(200);
      expect(response.data).toContain('Still working');

    } catch (error) {
      fail(`Request to ${url} failed: ${error.message}`);
    }
  });

});