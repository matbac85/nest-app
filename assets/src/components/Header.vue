<template>
  <nav
    class="flex justify-between items-center bg-primary_200 py-4 px-4 flex-none drop-shadow md:px-6"
  >
    <img
      src="../assets/logo-desktop.svg"
      alt="logo"
      class="max-w-[3rem] max-h-[3rem] lg:hidden"
    />
    <img
      src="../assets/logo-desktop.svg"
      alt=""
      class="hidden max-h-[3rem] lg:block"
    />
    <burgerMenu class="lg:hidden" />
    <ul class="hidden flex-row gap-8 text-primary_800 text-lg lg:flex">
      <li>
        <RouterLink class="nav-link" to="/">Accueil</RouterLink>
      </li>
      <li>
        <RouterLink class="nav-link" to="/login">Se connecter</RouterLink>
      </li>
      <li>
        <RouterLink class="nav-link" to="/register"
          >Enregistrer une cabane</RouterLink
        >
      </li>
      <li>
        <button>
          <img
            src="../assets/user-account-icon.svg"
            alt=""
            class="min-w-[2rem]"
          />
        </button>
      </li>
    </ul>
  </nav>
</template>

<script setup>
import BurgerMenu from "./BurgerMenu.vue";
import { RouterLink } from "vue-router";
</script>

<style scoped>
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
