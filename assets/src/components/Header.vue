<template>
  <nav
    class="flex justify-between items-center bg-primary_200 py-4 px-4 flex-none drop-shadow md:px-6"
  >
    <img
      src="../assets/logo-mobile.svg"
      alt="logo"
      class="max-w-[3rem] max-h-[3rem] lg:hidden"
    />
    <img
      src="../assets/logo-desktop.svg"
      alt=""
      class="hidden max-h-[3rem] lg:block"
    />
    <button>
      <burgerMenu class="lg:hidden" />
    </button>
    <ul class="hidden flex-row gap-8 text-primary_800 text-lg lg:flex">
      <li>
        <RouterLink class="nav-link" to="/">Accueil</RouterLink>
      </li>
      <li>
        <RouterLink class="nav-link" to="/cabins">Se connecter</RouterLink>
      </li>
      <li>
        <RouterLink class="nav-link" to="/register"
          >Enregistrer une cabane</RouterLink
        >
      </li>
      <li>
        <button @click="toggleMenu">
          <User />
        </button>
        <DropDownMenu v-if="isOpen">
          <a
            href="#"
            class="text-primary_800 block px-4 py-2 text-sm hover:bg-primary_300"
            role="menuitem"
            tabindex="-1"
            id="menu-item-0"
            >Se connecter</a
          >
          <a
            href="#"
            class="text-primary_800 block px-4 py-2 text-sm hover:bg-primary_300"
            role="menuitem"
            tabindex="-1"
            id="menu-item-1"
            >Enregistrer une cabane</a
          ></DropDownMenu
        >
      </li>
    </ul>
  </nav>
</template>

<script setup>
import { ref } from "vue";
import BurgerMenu from "./BurgerMenu.vue";
import { RouterLink } from "vue-router";
import User from "./User.vue";
import DropDownMenu from "./DropDownMenu.vue";

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
</style>
