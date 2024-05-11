<template>
  <div class="bg-primary_200 px-6 py-8 rounded-xl drop-shadow">
    <img :src="src" alt="" class="block min-w-full" />
    <h2>{{ name }}</h2>
  </div>
</template>

<script setup>
import { defineProps } from "vue";

const props = defineProps({
  name: String,
  src: String,
});
</script>

<style lang="scss" scoped></style>
