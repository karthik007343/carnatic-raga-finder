import { useState } from "react";

export default function FindNotes() {
  const [notes, setNotes] = useState("");
  const [result, setResult] = useState(null);

  const searchNotes = async () => {
    if (!notes.trim()) return;
    setResult("Loading...");
    try {
      const res = await fetch("http://localhost:5000/find-raga", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ notes: notes.trim() }),
      });
      const data = await res.json();
      setResult(!res.ok ? data.message || data.error : data);
    } catch (e) {
      setResult(e.message);
    }
  };

  return (
    <div>
      <h2>Find Raga by Notes</h2>
      <input value={notes} onChange={e => setNotes(e.target.value)} placeholder="Enter Notes e.g. C D E F G" />
      <button onClick={searchNotes}>Search</button>

      <div style={{ marginTop: "20px" }}>
        {result && typeof result === "string" && <p>{result}</p>}
        {result && typeof result === "object" && (
          <div>
            <h3>{result.name}</h3>
            <p><b>Notes:</b> {result.notes}</p>
            <p><b>Arohanam:</b> {result.arohanam}</p>
            <p><b>Avarohanam:</b> {result.avarohanam}</p>
          </div>
        )}
      </div>
    </div>
  );
}
