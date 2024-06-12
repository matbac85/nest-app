<template>
  <div
    class="bg-primary_200 rounded-xl px-4 py-6 max-w-[21.4375rem] md:py-8 md:px-6 md:max-w-fit drop-shadow"
  >
    <div
      class="font-dosis text-2xl font-semibold text-center text-primary_800"
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
  </div>
</template>

<script setup>
import { userStore } from "../stores/userStore";
</script>
