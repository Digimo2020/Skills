---
name: agentation
description: >-
  Add Agentation visual feedback toolbar to a React or Next.js web application.
  Allows clicking elements, selecting UI parts, and copying structured selectors and annotations
  directly to AI coding agents via MCP or clipboard.
user_invocable: true
---

# Agentation Setup & Integration

Set up the Agentation visual feedback toolbar in web applications to enable selecting and annotating any part of the UI.

## Steps

1. **Install Dependency**:
   Install `agentation` in devDependencies:
   ```bash
   pnpm add -D agentation
   # or
   npm install --save-dev agentation
   ```

2. **Mount the Component in Development**:
   - For **Next.js App Router**: In `app/layout.tsx` before `</body>`:
     ```tsx
     import { Agentation } from "agentation";

     export default function RootLayout({ children }: { children: React.ReactNode }) {
       return (
         <html lang="en">
           <body>
             {children}
             {process.env.NODE_ENV === "development" && (
               <Agentation endpoint="http://localhost:4747" />
             )}
           </body>
         </html>
       );
     }
     ```
   - For **Next.js Pages Router**: In `pages/_app.tsx`:
     ```tsx
     import { Agentation } from "agentation";

     export default function App({ Component, pageProps }: AppProps) {
       return (
         <>
           <Component {...pageProps} />
           {process.env.NODE_ENV === "development" && (
             <Agentation endpoint="http://localhost:4747" />
           )}
         </>
       );
     }
     ```
   - For **Vite / React SPA**: In `src/App.tsx`:
     ```tsx
     import { Agentation } from "agentation";

     export function App() {
       return (
         <>
           <YourApp />
           {import.meta.env.DEV && <Agentation endpoint="http://localhost:4747" />}
         </>
       );
     }
     ```

3. **Start the MCP Server**:
   Launch the Agentation annotation server:
   ```bash
   npx -y agentation-mcp server
   ```
   Or register it in your agent's MCP config:
   ```json
   {
     "mcpServers": {
       "agentation": {
         "command": "npx",
         "args": ["-y", "agentation-mcp", "server"]
       }
     }
   }
   ```

4. **Verify Setup**:
   - Run `npx agentation-mcp doctor` to confirm connectivity.
   - Click any element in your browser using the bottom-right toolbar to generate annotations.
