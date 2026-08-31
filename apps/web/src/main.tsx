import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import { APP_NAME } from '@celia/shared';
import './styles.css';
const App = () => <main><p className="eyebrow">Agent-ready application bootstrap</p><h1>{APP_NAME}</h1><p>Runtime foundation online. Feature development starts after the Application Bootstrap Gate.</p><span className="status">Contract preserved · API health available</span></main>;
createRoot(document.getElementById('root')!).render(<StrictMode><App /></StrictMode>);
