import './assets/css/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './global/router'
import axios from "@/global/axios";

const app = createApp(App)

app.use(createPinia())
app.use(router)
app.config.globalProperties.$axios = axios;

app.mount('#app')
