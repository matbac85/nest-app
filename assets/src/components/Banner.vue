<template>
  <div>
    <div
      class="font-dosis px-4 text-2xl font-semibold text-center text-primary_800 mb-4 max-w-[35rem] lg:text-3xl lg:mb-8 lg:px-0"
      v-if="userStore.user"
    >
      <p>
        Bonjour
        <strong class="font-bold text-primary_700">{{
          userStore.user.firstname
        }}</strong>
        !
      </p>
      <p>Prêt.e pour une nouvelle aventure ?</p>
    </div>
    <p
      class="font-dosis px-4 text-2xl font-semibold text-center text-primary_800 mb-4 max-w-[40rem] lg:text-3xl lg:mb-8 lg:px-0"
      v-else
    >
      Vivez
      <strong class="font-bold text-primary_700">une expérience</strong> unique
      en réservant votre cabane dans les arbres dès maintenant !
    </p>
  </div>
</template>

<script setup>
import { userStore } from "../stores/userStore";
</script>

<style lang="scss" scoped></style>
