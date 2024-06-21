<template>
  <RouterLink
    :to="{ name: 'CabinDetails', params: { id: id }, query: props.query }"
    class="block bg-primary_200 rounded-xl shadow-lg transform transition ease-in-out delay-150 hover:scale-105 duration-300"
  >
    <section class="overflow-hidden rounded-t-xl">
      <Slider :src="src" :id="id" :favorite="favorite" />
    </section>
    <section class="px-6 py-6">
      <h2 class="txt-h2">{{ name }}</h2>
      <p class="txt-body">{{ city }}</p>
      <p class="txt-body">
        <strong class="txt-body-strong">{{ price }} €</strong> par voyageur
      </p>
    </section>
  </RouterLink>
</template>

<script setup>
import { defineProps } from "vue";
import Slider from "./Slider.vue";
import { RouterLink } from "vue-router";

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
