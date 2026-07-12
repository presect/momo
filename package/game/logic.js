// Local same-screen game - the platform requires a rules module; this stub
// satisfies it. All gameplay runs in the client (index.html + assets/game.js).
export const meta = { game: "maxi-coast-rush", minPlayers: 1, maxPlayers: 1 };
export function setup() { return {}; }
export function validateAction() { return { ok: true }; }
export function applyAction(state) { return state; }
export function isGameOver() { return { over: false }; }
export function viewFor(state) { return state; }
