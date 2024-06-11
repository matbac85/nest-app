import { reactive } from "vue";

export const userStore = reactive({
  user: null,
  setUser(user) {
    this.user = user;
  },
  logOut() {
    localStorage.removeItem("user");
    this.user = null;
  },
});
