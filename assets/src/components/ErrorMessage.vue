<template>
  <div
    class="bg-primary_200 rounded-xl shadow-lg py-10 px-8 md:py-12 md:px-10 text-center font-dosis text-base lg:text-lg xl:text-xl"
  >
    <p>
      Désolé, aucune cabane ne correspond à votre recherche. Essayez de modifier
      vos critères et
      <RouterLink
        class="text-primary_700 underline hover:text-primary_500"
        to="/"
        >Réessayez !</RouterLink
      >
    </p>
  </div>
</template>

<script setup>
import { RouterLink } from "vue-router";
</script>

<style lang="scss" scoped></style>
