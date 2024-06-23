<template>
  <header class="fixed top-0 left-0 right-0 bg-primary_200 drop-shadow z-50">
    <nav class="flex justify-between items-center py-4 px-4 md:px-6 xl:px-14">
      <RouterLink to="/" aria-label="Homepage">
        <img
          src="/src/assets/images/logo-mobile.svg"
          alt="logo mobile"
          class="w-[3rem] h-[3rem] lg:hidden"
        />
        <img
          src="/src/assets/images/logo-desktop.svg"
          alt="logo desktop"
          class="hidden h-[3rem] lg:block"
        />
      </RouterLink>
      <button aria-label="Open menu" class="lg:hidden">
        <burgerMenu />
      </button>
      <ul
        class="hidden items-center flex-row gap-6 text-primary_800 text-lg lg:flex"
      >
        <li>
          <RouterLink class="nav-link" to="/">Accueil</RouterLink>
        </li>
        <li>
          <button
            @click="toggleMenu"
            class="flex items-center"
            aria-expanded="isOpen"
            aria-haspopup="true"
            aria-label="User menu"
          >
            <LoggedInIcon v-if="userStore.user" />
            <User v-else />
          </button>
          <DropDownMenu v-if="isOpen">
            <RouterLink
              class="text-primary_700 block px-6 py-2 text-base font-medium hover:bg-primary_300"
              to="/login"
              v-if="!userStore.user"
              >Se connecter</RouterLink
            >
            <RouterLink
              class="text-primary_700 block px-6 py-2 text-base font-medium hover:bg-primary_300"
              to="/profile"
              v-if="userStore.user"
              >Compte</RouterLink
            >
            <button
              class="text-primary_700 block px-6 py-2 text-base font-medium hover:bg-primary_300"
              v-if="userStore.user"
              @click="userStore.logOut()"
            >
              Se déconnecter
            </button>
            <RouterLink
              class="text-primary_700 block px-6 py-2 text-base font-medium hover:bg-primary_300"
              to="/register"
              v-if="!userStore.user"
              >S'enregistrer</RouterLink
            >
          </DropDownMenu>
        </li>
      </ul>
    </nav>
  </header>
</template>

<script setup>
import { ref } from "vue";
import BurgerMenu from "./BurgerMenu.vue";
import { RouterLink } from "vue-router";
import User from "./User.vue";
import DropDownMenu from "./DropDownMenu.vue";
import { userStore } from "../stores/userStore";
import LoggedInIcon from "./LoggedInIcon.vue";

const isOpen = ref(false);

const toggleMenu = () => {
  isOpen.value = !isOpen.value;
};
</script>

<style>
.nav-link {
  display: inline-block;
  position: relative;
  color: #51746f;
}

.nav-link:hover {
  color: #87c1b9;
}

.nav-link::after {
  content: "";
  position: absolute;
  width: 100%;
  transform: scaleX(0);
  height: 2px;
  bottom: 0;
  left: 0;
  background-color: #87c1b9;
  transform-origin: bottom right;
  transition: transform 0.25s ease-out;
}

.nav-link:hover::after {
  transform: scaleX(1);
  transform-origin: bottom left;
}

.router-link-active::after,
.router-link-exact-active::after {
  transform: scaleX(1);
  transform-origin: bottom left;
}
</style>
