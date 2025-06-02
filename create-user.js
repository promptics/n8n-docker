const http = require('http');

const email = process.env.N8N_DEFAULT_EMAIL || 'admin@example.com';
const password = process.env.N8N_DEFAULT_PASSWORD || 'changeme';
const firstName = process.env.N8N_DEFAULT_FIRSTNAME || 'Owner';
const lastName = process.env.N8N_DEFAULT_LASTNAME || 'User';

const data = JSON.stringify({ email, password, firstName, lastName });

function setup() {
  const req = http.request({
    hostname: 'localhost',
    port: 5678,
    path: '/rest/owner/setup',
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Content-Length': Buffer.byteLength(data),
    },
  }, res => {
    if (res.statusCode >= 200 && res.statusCode < 300) {
      console.log('Owner account created');
    } else if (res.statusCode === 400 || res.statusCode === 409) {
      console.log('Owner already exists');
    } else {
      console.log(`Unexpected response: ${res.statusCode}`);
    }
  });

  req.on('error', err => {
    console.error('Setup request failed:', err.message);
  });

  req.write(data);
  req.end();
}

setup();
