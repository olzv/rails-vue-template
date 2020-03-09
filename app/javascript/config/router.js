import Vue           from "vue";
import VueRouter     from "vue-router";

import Welcome       from '../pages/welcome'
import Dashboard     from '../pages/dashboard'
import Users         from '../pages/users'


const routes = [
    { path: '/',            component: Welcome,     name: 'root' },
    { path: '/dashboard',   component: Dashboard                 },
    { path: '/users',       component: Users                     },
]


const router = new VueRouter({
    mode: 'history',
    routes
})

Vue.use(VueRouter)

export default router;