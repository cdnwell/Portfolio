import {BrowserRouter, Route, Routes} from "react-router-dom";
import LoginPage from "./page/login/LoginPage.tsx";

const App = () => {
    return (
        <BrowserRouter>
            <Routes>
                <Route path={"/"} element={<LoginPage />}></Route>
            </Routes>
        </BrowserRouter>
    );
};

export default App;
