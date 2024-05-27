<template>
  <div
    class="min-w-full flex justify-between items-center gap-3 md:justify-start"
  >
    <div class="text-base md:text-lg">
      <p class="font-semibold">
        70 € <strong class="text-sm font-base font-normal">par nuit</strong>
      </p>
    </div>
    <RouterLink
      to="/payment"
      class="transition ease-in-out delay-150 block font-ubuntu text-base font-semibold text-primary_200 bg-primary_700 py-3 px-4 rounded-lg min-w-fit tracking-wide hover:bg-primary_500 hover:scale-105 duration-300"
    >
      Demande de réservation
    </RouterLink>
  </div>
</template>

<script setup>
import { RouterLink } from "vue-router";
</script>

<style scoped></style>
