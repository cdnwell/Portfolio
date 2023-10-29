import { Routes, Route } from 'react-router'

import Login from './domain/pages/login/Login'
import Chat from './domain/pages/chat/Chat'
import SignIn from './domain/pages/login/signin/SignIn'
import Register from './domain/pages/login/register/Register'

function App() {

  return (
    <Routes>
      <Route path="/" element={<Login />} />
      <Route path="/login" element={<Login />} />
      <Route path="/chat" element={<Chat />} />
      <Route path="/signin" element={<SignIn />} />
      <Route path="/register" element={<Register />} />
    </Routes>
  )
}

export default App
