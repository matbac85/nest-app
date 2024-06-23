<template>
  <div
    class="bg-primary_200 rounded-xl shadow-lg py-10 px-8 text-center"
    v-if="userStore.user"
  >
    <p class="font-dosis text-lg lg:text-xl xl:text-2xl m-0">
      Merci
      <strong class="font-bold text-primary_700">{{
        userStore.user.firstname
      }}</strong>
      !
    </p>
    <p class="font-dosis text-lg lg:text-xl xl:text-2xl mb-2">
      Bon séjour et à très bientôt sur Nest !
    </p>
    <RouterLink
      class="text-primary_700 txt-body-strong underline hover:text-primary_500"
      to="/"
      >Retour à l'accueil</RouterLink
    >
  </div>
</template>

<script setup>
import { userStore } from "../stores/userStore";
</script>
