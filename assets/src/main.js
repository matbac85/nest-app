import { createApp } from "vue";
import "./style.css";
import App from "./App.vue";
import router from "./router"; // Importez le routeur que vous avez configuré

createApp(App)
  .use(router) // Utilisez le routeur dans votre application Vue
  .mount("#app");
