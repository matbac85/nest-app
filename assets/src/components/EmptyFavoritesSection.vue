<template>
  <section>
    <p class="txt-body">
      Vous n'avez pas encore ajouté de cabane à vos favoris.
      <RouterLink
        class="txt-body-strong text-primary_700 underline hover:text-primary_500"
        to="/"
        >Parcourez nos cabanes et ajoutez celles qui vous plaisent le plus
        !</RouterLink
      >
    </p>
  </section>
</template>

<script setup>
import { RouterLink } from "vue-router";
</script>

<style lang="scss" scoped></style>
