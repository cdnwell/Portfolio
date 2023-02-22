import ReactDOM from "react-dom/client";
import { Provider } from "react-redux";

import App from "./App";
import "./index.scss";
import store from "./components/store";

import { BrowserRouter } from "react-router-dom";

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  <Provider store={store}>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </Provider>
);
