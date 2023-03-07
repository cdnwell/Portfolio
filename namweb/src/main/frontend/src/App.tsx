import { Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Book from "./pages/Book";
import Layout from "./components/layout/Layout";
import Login from "./pages/Login/Login";
import Register from "./pages/Login/Register/Register";
import FindIdPw from "./pages/Login/FindIdPw/FindIdPw";
import FindId from "./pages/Login/FindIdPw/FindId/FindId";


function App() {
  return (
    <Layout>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/book" element={<Book />} />
        <Route path="/login/*" element={<Login />} />
        <Route path="/login/register" element={<Register />} />
        <Route path="/login/find-id-pw" element={<FindIdPw />} />
        <Route path="/login/find-id-pw/find-id" element={<FindId />} />
      </Routes>
    </Layout>
  );
}

export default App;
