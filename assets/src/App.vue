<script setup>
import { defineProps } from "vue";
import { userStore } from "./stores/userStore";
const props = defineProps();
const user = localStorage.getItem("user");
if (user) {
  userStore.setUser(JSON.parse(user));
}
// const router = useRouter();
</script>

<template>
  <div>
    <router-view />
  </div>
</template>
