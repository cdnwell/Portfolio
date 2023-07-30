import { Routes, Route } from 'react-router'
import { SignUp } from './domain/chat/pages/signup'
import { SignIn } from './domain/chat/pages/signin'
import { Home } from './domain/chat/pages/home';
import { Chat } from './domain/chat/pages/chat';
import { QueryClient, QueryClientProvider } from 'react-query';
import { UserProvider } from './domain/chat/context/user-context';
import { StylesProvider } from '@material-ui/core';
import { DndProvider } from 'react-dnd';
import { HTML5Backend } from "react-dnd-html5-backend";
import { Result } from './domain/chat/pages/result';
import { Mypage } from './domain/chat/pages/mypage';

const queryClient = new QueryClient();

import Login from './domain/pages/login/Login'
// import Chat from './domain/pages/chat/Chat'

function App() {

  return (
    <div className={"App"}>
      <StylesProvider injectFirst>
        <DndProvider backend={HTML5Backend}>
          <UserProvider>
            <QueryClientProvider client={queryClient}>
              <Routes>
                <Route path="/" element={<Home />} />
                <Route path="/signin" element={<SignIn />} />
                <Route path="/signup" element={<SignUp />} />
                <Route path="/chat" element={<Chat />} />
                <Route path="/result" element={<Result />} />
                <Route path="/mypage" element={<Mypage />} />
                {/* <Route path="/" element={<Login />} />
                <Route path="/login" element={<Login />} />
                <Route path="/chat" element={<Chat />} /> */}
              </Routes>
            </QueryClientProvider>
          </UserProvider>
        </DndProvider>
      </StylesProvider>
    </div>
  )
}

export default App
