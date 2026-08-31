import { describe, expect, it } from 'vitest';
import { healthPayload } from '../src/server.js';
describe('Celia API health contract', () => { it('returns a valid health response', () => { expect(healthPayload()).toEqual({ status: 'ok', service: 'celia-api', version: '0.1.0' }); }); });
