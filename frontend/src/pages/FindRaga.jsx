import { useState } from "react";

export default function FindRaga() {
  const [raga, setRaga] = useState("");
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!raga.trim()) return alert("Enter a raga name");

    setLoading(true);
    setResult(null);

    try {
      const res = await fetch("http://localhost:5000/find-notes", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ raga: raga.trim() }),
      });
      const data = await res.json();
      setResult(data);
    } catch (err) {
      console.error(err);
      setResult({ error: "Failed to fetch. Check backend server." });
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="page">
      <h2>🔍 Find Raga by Name</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={raga}
          onChange={(e) => setRaga(e.target.value)}
          placeholder="e.g., Kharaharapriya"
        />
        <button type="submit">Search</button>
      </form>

      {loading && <p>Loading...</p>}

      {result && (
        <div className="result">
          {result.error || result.message ? (
            <p>{result.error || result.message}</p>
          ) : (
            <>
              <h3>{result.name}</h3>
              <p><b>Notes:</b> {result.notes}</p>
              <p><b>Arohanam:</b> {result.arohanam}</p>
              <p><b>Avarohanam:</b> {result.avarohanam}</p>
              <p>{result.description}</p>
            </>
          )}
        </div>
      )}
    </div>
  );
}
