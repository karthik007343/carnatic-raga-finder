import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import FindRaga from "./pages/FindRaga";
import Navbar from "./components/Navbar";
import FindNotes from "./pages/FindNotes";
import VirtualPiano from "./pages/VirtualPiano";
import RagasList from "./pages/RagasList";
import About from "./pages/About";
import './App.css';

function App() {
  return (
    <Router>
      <Navbar />
      <div className="App">
        <Routes>
          <Route path="/" element={<FindRaga />} />
          <Route path="/find-notes" element={<FindNotes />} />
          <Route path="/piano" element={<VirtualPiano />} />
          <Route path="/ragas" element={<RagasList />} />
          <Route path="/about" element={<About />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
