import { createRouter, createWebHistory } from 'vue-router'
import Login from "@/page/login/Login.vue";
import SignUp from "@/page/signup/SignUp.vue";
import Dashboard from "@/page/dashboard/Dashboard.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'login',
      component: Login
    },
    {
      path: '/signUp',
      name: 'signUp',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: SignUp
    },
    {
      path: '/findIdPw'
      , name: 'findIdPw'
      , component: SignUp
    }
    , {
      path: '/dashboard'
      , name: 'dashboard'
      , component: Dashboard
    }
  ]
})

export default router
