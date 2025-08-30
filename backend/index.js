const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

const app = express();

app.use(cors());
app.use(express.json());

// ---------- DB ----------
let db;
async function initDB() {
  db = await mysql.createPool({
    host: "localhost",
    user: "root",
    password: "karthik@9959",
    database: "carnaticdb",
    waitForConnections: true,
    connectionLimit: 10,
  });
  console.log("✅ Connected to MySQL: carnaticdb");
}
initDB().catch((e) => console.error("DB init error:", e));

// Helpers
const norm = (s = "") =>
  s.trim().toLowerCase().replace(/\s+/g, " "); // normalize spaces + case

// ---------- ROUTES ----------

// POST /find-notes  { raga: "Kalyani" } -> returns raga info
app.post("/find-notes", async (req, res) => {
  try {
    const ragaName = (req.body.raga || "").trim();
    if (!ragaName) return res.status(400).json({ error: "Raga name is required" });

    const [rows] = await db.query(
      "SELECT * FROM ragas WHERE LOWER(name) = LOWER(?) LIMIT 1",
      [ragaName]
    );

    if (rows.length === 0) return res.status(404).json({ message: "Raga not found" });

    const raga = rows[0];
    res.json({
      name: raga.name,
      notes: raga.notes,
      arohanam: raga.arohanam,
      avarohanam: raga.avarohanam,
      description: raga.description,
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// POST /find-raga  { notes: "C D E F G" } -> returns raga info
app.post("/find-raga", async (req, res) => {
  try {
    const inputNotes = (req.body.notes || "").trim();
    if (!inputNotes) return res.status(400).json({ error: "Notes are required" });

    const [rows] = await db.query("SELECT * FROM ragas");
    const match = rows.find((r) => norm(r.notes) === norm(inputNotes));

    if (!match) return res.status(404).json({ message: "No matching raga found" });

    res.json({
      name: match.name,
      notes: match.notes,
      arohanam: match.arohanam,
      avarohanam: match.avarohanam,
      description: match.description,
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// GET /ragas -> list all ragas
app.get("/ragas", async (_req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM ragas ORDER BY name");
    res.json(rows);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// GET /note/:note -> ragas containing a specific note
app.get("/note/:note", async (req, res) => {
  try {
    const note = (req.params.note || "").toUpperCase();
    if (!note) return res.status(400).json({ error: "Note parameter is required" });

    const [rows] = await db.query("SELECT name, notes FROM ragas");
    const result = rows.filter((r) =>
      r.notes.split(/\s+/).map((n) => n.toUpperCase()).includes(note)
    );
    res.json(result);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Optional: GET /mood/:mood -> predefined moods
app.get("/mood/:mood", (_req, res) => {
  const mood = (_req.params.mood || "").toLowerCase();
  const moodMap = {
    happy: ["Shankarabharanam", "Kalyani"],
    devotional: ["Mayamalavagowla"],
    romantic: ["Kharaharapriya"],
    calm: ["Shankarabharanam"],
    sad: ["Todi", "Subhapantuvarali"],
  };
  res.json(moodMap[mood] || []);
});

// ---------- START SERVER ----------
const PORT = 5000;
app.listen(PORT, () => console.log(`🚀 API running at http://localhost:${PORT}`));
