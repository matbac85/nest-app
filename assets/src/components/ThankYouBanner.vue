<template>
  <div
    class="bg-primary_200 rounded-xl shadow-lg py-10 px-8 font-dosis text-base lg:text-lg xl:text-xl m-0 text-center"
    v-if="userStore.user"
  >
    <p>
      Merci
      <strong class="font-bold text-primary_700">{{
        userStore.user.firstname
      }}</strong>
      !
    </p>
    <p>Bon séjour et à très bientôt sur Nest !</p>
  </div>
</template>

<script setup>
import { userStore } from "../stores/userStore";
</script>
