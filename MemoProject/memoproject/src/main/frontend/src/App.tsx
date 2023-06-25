import { useState, useEffect } from 'react'
import { Routes, Route } from "react-router-dom";

import axios from './global/config/axiosInstance';
import Login from './domain/pages/login/Login';

function App() {
  const [hello, setHello] = useState("");

  useEffect(()=>{
    axios.get("/api/test")
         .then(response => setHello(response.data))
  }, []);

  return (
    <Routes>
      <Route path="/" element={<Login />}/>
      <Route path="/login" element={<Login />}/>
    </Routes>
  )
}

export default App;
