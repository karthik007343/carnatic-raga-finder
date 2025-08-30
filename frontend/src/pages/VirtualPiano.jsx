import { useState } from "react";
const WHITE_KEYS = ["S", "R2", "G3", "M1", "P", "D2", "N3"];
const BLACK_KEYS = [
  { note: "R1", left: 40 },  
  { note: "G2", left: 100 }, 
  { note: "M2", left: 220 }, 
  { note: "D1", left: 280 }, 
  { note: "N2", left: 340 }, 
];

export default function VirtualPiano() {
  const [playedNotes, setPlayedNotes] = useState([]);
  const [result, setResult] = useState(null);

  const tapNote = (note) => {
    const newNotes = [...playedNotes, note];
    setPlayedNotes(newNotes);
    searchRaga(newNotes);
  };

  const searchRaga = async (notesArr) => {
    if (notesArr.length === 0) return;
    try {
      const res = await fetch("http://localhost:5000/find-raga", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ notes: notesArr.join(" ") }),
      });
      const data = await res.json();
      setResult(!res.ok ? data.message || data.error : data);
    } catch (e) {
      setResult(e.message);
    }
  };

  return (
    <div className="page">
      <h2>🎹 Virtual Piano (Carnatic Notes)</h2>

      <div className="piano-container">
        <div className="white-keys">
          {WHITE_KEYS.map((note, i) => (
            <div
              key={i}
              className="white-key"
              onClick={() => tapNote(note)}
            >
              <span className="note-label">{note}</span>
            </div>
          ))}
        </div>

        <div className="black-keys">
          {BLACK_KEYS.map((b, i) => (
            <div
              key={i}
              className="black-key"
              style={{ left: `${b.left}px` }}
              onClick={() => tapNote(b.note)}
            >
              <span className="note-label">{b.note}</span>
            </div>
          ))}
        </div>
      </div>

      <div className="played-notes">
        <b>Played Notes:</b> {playedNotes.join(" ")}
      </div>

      {result && (
        <div className="result">
          {typeof result === "string" ? (
            <p>{result}</p>
          ) : (
            <>
              <h3>{result.name}</h3>
              <p><b>Notes:</b> {result.notes}</p>
              <p><b>Arohanam:</b> {result.arohanam}</p>
              <p><b>Avarohanam:</b> {result.avarohanam}</p>
            </>
          )}
        </div>
      )}

      <button onClick={() => { setPlayedNotes([]); setResult(null); }}>Reset</button>
    </div>
  );
}
