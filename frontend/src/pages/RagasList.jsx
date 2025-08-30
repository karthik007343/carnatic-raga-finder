import { useEffect, useState } from "react";

export default function RagasList() {
  const [ragas, setRagas] = useState([]);

  useEffect(() => {
    fetch("http://localhost:5000/ragas")
      .then(res => res.json())
      .then(data => setRagas(data))
      .catch(console.error);
  }, []);

  return (
    <div>
      <h2>All Melakartha Ragas</h2>
      <ul>
        {ragas.map(r => (
          <li key={r.id}>{r.name} - {r.notes}</li>
        ))}
      </ul>
    </div>
  );
}
