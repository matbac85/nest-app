<template>
  <div>
    <div
      :class="[
        'tham',
        'tham-e-squeeze',
        'tham-w-6',
        { 'tham-active': isActive },
      ]"
      @click="toggleActive"
      class="tham-w-8"
    >
      <div class="tham-box">
        <div class="tham-inner z-50" />
      </div>
      <div
        v-if="isActive"
        class="absolute right-0 top-0 bg-primary_200 min-h-screen flex flex-col justify-center items-start w-screen"
      >
        <RouterLink
          class="block px-8 py-4 text-xl font-semibold text-primary_700"
          to="/"
          >Accueil</RouterLink
        >
        <RouterLink
          class="block px-8 py-4 text-xl font-semibold text-primary_700"
          to="/register"
          >S'enregistrer</RouterLink
        >
        <RouterLink
          class="block px-8 py-4 text-xl font-semibold text-primary_700"
          to="/login"
          v-if="!userStore.user"
          >Se connecter</RouterLink
        >
        <button
          class="block px-8 py-4 text-xl font-semibold text-primary_700"
          to="/login"
          @click="userStore.logOut()"
          v-if="userStore.user"
        >
          Se déconnecter
        </button>
        <RouterLink
          class="block px-8 py-4 text-xl font-semibold text-primary_700"
          to="/profile"
          v-if="userStore.user"
          >Compte</RouterLink
        >
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { userStore } from "../stores/userStore";

const isActive = ref(false);

const toggleActive = () => {
  isActive.value = !isActive.value;
};
</script>

<style scoped>
.tham-inner {
  background-color: #51746f;
}

.tham:hover {
  opacity: 1;
}
</style>
