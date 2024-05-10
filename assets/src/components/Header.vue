<template>
  <nav
    class="flex justify-between items-center bg-primary_200 py-4 px-4 items-start flex-none drop-shadow"
  >
    <img
      src="../assets/logo-mobile.svg"
      alt="logo"
      class="max-w-[3rem] max-h-[3rem] lg:hidden"
    />
    <img
      src="../assets/logo-desktop.svg"
      alt=""
      class="hidden max-h-[4rem] lg:block"
    />
    <burgerMenu class="lg:hidden" />
    <ul class="hidden flex-row gap-4 lg:flex">
      <li>Accueil</li>
      <li>Se connecter</li>
      <li>Enregistrer une cabane</li>
    </ul>
  </nav>
</template>

<script setup>
import BurgerMenu from "./BurgerMenu.vue";
</script>
