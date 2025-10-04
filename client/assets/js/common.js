export const API_BASE = 'http://localhost:3000/api';

export async function fetchJSON(url) {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  return res.json();
}

export function formatDateTime(dtStr) {
  const d = new Date(dtStr);
  const pad = (n) => (n < 10 ? '0' + n : n);
  return `${d.getFullYear()}-${pad(d.getMonth()+1)}-${pad(d.getDate())} ${pad(d.getHours())}:${pad(d.getMinutes())}`;
}

export function isEnded(endStr) {
  return new Date(endStr).getTime() < Date.now();
}

