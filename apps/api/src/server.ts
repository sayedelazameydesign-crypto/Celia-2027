import { createServer, type IncomingMessage, type ServerResponse } from 'node:http';
import { HealthResponseSchema } from '@celia/contracts';
import { APP_VERSION } from '@celia/shared';

export const healthPayload = () => HealthResponseSchema.parse({ status: 'ok', service: 'celia-api', version: APP_VERSION });
export const requestHandler = (_req: IncomingMessage, res: ServerResponse) => {
  if (_req.url === '/health' && _req.method === 'GET') {
    res.writeHead(200, { 'content-type': 'application/json' });
    res.end(JSON.stringify(healthPayload()));
    return;
  }
  res.writeHead(404, { 'content-type': 'application/json' });
  res.end(JSON.stringify({ error: 'Not found' }));
};

const port = Number(process.env.PORT ?? 4173);
if (process.env.NODE_ENV !== 'test') {
  createServer(requestHandler).listen(port, '127.0.0.1', () => console.log(`Celia API listening on http://127.0.0.1:${port}`));
}
