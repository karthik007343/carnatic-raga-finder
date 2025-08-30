import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <nav style={{ marginBottom: "20px" }}>
      <Link to="/" style={{ marginRight: 15 }}>Find Raga</Link>
      <Link to="/find-notes" style={{ marginRight: 15 }}>Find Notes</Link>
      <Link to="/piano" style={{ marginRight: 15 }}>Virtual Piano</Link>
      <Link to="/ragas" style={{ marginRight: 15 }}>All Ragas</Link>
      <Link to="/about">About</Link>
    </nav>
  );
}
