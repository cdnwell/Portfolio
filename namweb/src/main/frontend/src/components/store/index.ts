import { configureStore } from "@reduxjs/toolkit";

import bookReducer from "./book";
import loginReducer from "./login";

const store = configureStore({
  reducer: { book : bookReducer, login : loginReducer },
});

export default store;
