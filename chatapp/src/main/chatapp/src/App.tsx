import { Routes, Route } from 'react-router'

import Login from './domain/pages/login/Login'
import Chat from './domain/pages/chat/Chat'

function App() {

  return (
    <Routes>
      <Route path="/" element={<Login />} />
      <Route path="/login" element={<Login />} />
      <Route path="/chat" element={<Chat />} />
    </Routes>
  )
}

export default App
