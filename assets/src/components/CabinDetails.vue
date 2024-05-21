<template>
  <div class="bg-primary_200 rounded-xl drop-shadow">
    <div class="rounded-t-xl">
      <img :src="src" alt="" class="block min-w-full rounded-t-xl" />
    </div>
    <div class="px-6 py-8">
      <h2>{{ name }}</h2>
    </div>
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
