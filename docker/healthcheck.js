/**
 * script para healthcheck utilizado no docker
 *
healthcheck:
  test: [ "CMD", "node", "scripts/healthcheck.js" ]
  interval: 30s
  timeout: 10s
  retries: 5
  start_period: 5s
*/

const http = require('http');

const options = {
  host : 'localhost',
  port : process.env.PORT, // || DEFAULT_PORT,
  timeout : 2000,
};

const req = http.request(options, (res) => {
  console.log(`STATUS: ${res.statusCode}`);
  if (res.statusCode !== 200)
    return process.exit(1);
  process.exit(0);
});

req.on('error', () => {
  console.log('ERROR');
  process.exit(1);
});

req.end();
