<template>
  <header class="px-4 max-w-[35rem]">
    <section v-if="userStore.user" class="text-center">
      <p class="txt-header">
        Bonjour
        <strong class="font-bold text-primary_700">{{
          userStore.user.firstname
        }}</strong>
        ! <br />Prêt.e pour une nouvelle aventure ?
      </p>
    </section>
    <section v-else class="text-center">
      <p class="txt-header">
        Vivez une expérience
        <strong class="font-bold text-primary_700">unique</strong>
        en réservant votre cabane dans les arbres dès maintenant !
      </p>
    </section>
  </header>
</template>

<script setup>
import { userStore } from "../stores/userStore";
</script>

<style lang="scss" scoped></style>
