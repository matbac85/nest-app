import { createRouter, createWebHistory } from "vue-router";
import HomePage from "./pages/HomePage.vue";
import CabinListPage from "./pages/CabinListPage.vue";
import LoginPage from "./pages/LoginPage.vue";
import CabinDetailsPage from "./pages/CabinDetailsPage.vue";
import RegistrationPage from "./pages/RegistrationPage.vue";
import PaymentPage from "./pages/PaymentPage.vue";
import ProfilePage from "./pages/ProfilePage.vue";
import ThankYouPage from "./pages/ThankYouPage.vue";
import NotFoundPage from "./pages/NotFoundPage.vue";

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
  {
    path: "/payment/:id",
    name: "Payment",
    component: PaymentPage,
  },
  {
    path: "/profile",
    name: "Profile",
    component: ProfilePage,
  },
  {
    path: "/thanks",
    name: "ThankYou",
    component: ThankYouPage,
  },
  {
    path: "/:pathMatch(.*)*",
    name: "NotFound",
    component: NotFoundPage,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
