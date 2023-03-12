import { Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Book from "./pages/Book";
import Layout from "./components/layout/Layout";
import Login from "./pages/Login/Login";
import Register from "./pages/Login/Register/Register";
import FindPw from "./pages/Login/FindPw/FindPw";
import ChangePw from "./pages/Login/ChangePw/ChangePw";
import Board from "./pages/Board";
import NotFind from "./pages/NotFind";
import BoardWritePage from "./components/board/write/BoardWritePage";

function App() {
  return (
    <Layout>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/book" element={<Book />} />
        <Route path="/board" element={<Board />} />
        <Route path="/board/write" element={<BoardWritePage />} />
        <Route path="/login/*" element={<Login />} />
        <Route path="/login/register" element={<Register />} />
        <Route path="/login/find-pw" element={<FindPw />} />
        <Route path="/login/pw-change" element={<ChangePw />} />
        <Route path="/*" element={<NotFind />} />
      </Routes>
    </Layout>
  );
}

export default App;
