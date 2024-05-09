import { createRouter, createWebHistory } from "vue-router";
import HomePage from "./pages/HomePage.vue";
import CabinListPage from "./pages/CabinListPage.vue";
import LoginPage from "./pages/LoginPage.vue";
import CabinDetailsPage from "./pages/CabinDetailsPage.vue";
import RegistrationPage from "./pages/RegistrationPage.vue";

const routes = [
  {
    path: "/",
    name: "Home",
    component: HomePage,
  },
  {
    path: "/cabins",
    name: "CabinList",
    component: CabinListPage,
  },
  {
    path: "/cabins/:id",
    name: "CabinDetails",
    component: CabinDetailsPage,
    props: true,
  },
  {
    path: "/login",
    name: "Login",
    component: LoginPage,
  },
  {
    path: "/register",
    name: "Register",
    component: RegistrationPage,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
