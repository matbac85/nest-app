<template>
  <section>
    <p class="txt-body">
      Vous n'avez pas encore réservé de cabane.
      <RouterLink
        class="text-primary_700 txt-body-strong underline hover:text-primary_500"
        to="/"
        >Commencez à explorer et réservez votre première cabane dès maintenant
        !</RouterLink
      >
    </p>
  </section>
</template>

<script setup>
import { RouterLink } from "vue-router";
</script>

<style lang="scss" scoped></style>
