import React from 'react'
import ReactDOM from 'react-dom/client'
import { Provider} from 'react-redux'
import App from './App.tsx'
import { BrowserRouter } from 'react-router-dom'

import store from "./global/reducers/index.ts"

ReactDOM.createRoot(document.getElementById('root')!).render(
  <Provider store={store}>
    <BrowserRouter>
        <App />
    </BrowserRouter>
  </Provider>
)
