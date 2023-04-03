import { combineReducers, configureStore } from "@reduxjs/toolkit";
import sessionStorage from "redux-persist/lib/storage/session";

import { persistReducer } from "redux-persist";
import { FLUSH, REHYDRATE, PAUSE, PERSIST, PURGE, REGISTER } from "redux-persist";

import bookReducer from "./book";
import loginReducer from "./login";
import searchReducer from "./search";
import replyReducer from "./reply";
import backgroundReducer from "./background";

const reducers = combineReducers({
  login: loginReducer,
  book: bookReducer,
  search : searchReducer,
  reply : replyReducer,
  background : backgroundReducer,
});

const persistConfig = {
  key: "root",
  storage : sessionStorage,
  whitelist: ["login"],
};

const persistedReducer = persistReducer(persistConfig, reducers);

const store = configureStore({
  reducer: persistedReducer,
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: {
        ignoredActions: [FLUSH, REHYDRATE, PAUSE, PERSIST, PURGE, REGISTER],
      },
    }),
});

export default store;
