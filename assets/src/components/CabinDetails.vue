<template>
  <RouterLink
    :to="{ name: 'CabinDetails', params: { id: id }, query: props.query }"
  >
    <div
      class="bg-primary_200 rounded-xl drop-shadow transition ease-in-out delay-150 hover:scale-105 duration-300"
    >
      <Slider :src="src" :id="id" :favorite="favorite" />
      <div class="px-6 py-6">
        <h2 class="text-primary_700 font-dosis font-bold text-xl">
          {{ name }}
        </h2>
        <p class="text-primary_800 font-normal text-base">
          {{ city }}
        </p>
        <p class="text-primary_800 font-normal text-base">
          <strong>{{ price }} €</strong> par voyageur
        </p>
      </div>
    </div>
  </RouterLink>
</template>

<script setup>
import { defineProps } from "vue";
import Slider from "./Slider.vue";

const props = defineProps({
  name: String,
  src: Array,
  city: String,
  price: Number,
  id: Number,
  query: Object,
  favorite: Boolean,
});
</script>

<style lang="scss" scoped></style>
