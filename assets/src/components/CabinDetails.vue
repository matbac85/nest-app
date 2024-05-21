<template>
  <div class="bg-primary_200 rounded-xl drop-shadow">
    <Slider :src="src" />
    <div class="px-6 py-6">
      <h2 class="text-primary_700 font-dosis font-bold text-xl">
        {{ name }}
      </h2>
      <p class="text-primary_800 font-ubuntu font-normal text-base">
        {{ city }}
      </p>
      <p class="text-primary_800 font-ubuntu font-normal text-base">
        <strong>{{ price }} €</strong> par voyageur
      </p>
    </div>
  </div>
</template>

<script setup>
import { defineProps } from "vue";
import Slider from "./Slider.vue";

const props = defineProps({
  name: String,
  src: Array,
  city: String,
  price: Number,
});
</script>

<style lang="scss" scoped></style>
