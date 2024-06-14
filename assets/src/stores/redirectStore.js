import { reactive } from "vue";

export const redirectStore = reactive({
  url: null,
  setUrl(url) {
    this.url = url;
  },
  resetUrl() {
    this.url = null;
  },
});
