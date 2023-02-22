import { Routes } from 'react-router-dom';
import { Route } from 'react-router';
import Home from './pages/Home';
import Book from './pages/Book';
import Layout from './components/layout/Layout';
import Login from './pages/Login';

function App() {
  return (
    <Layout>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/book" element={<Book />} />
        <Route path="/login/*" element={<Login />} />
      </Routes>
    </Layout>
  )
}

export default App
