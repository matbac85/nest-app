<template>
  <div class="mb-4">
    <h1
      class="font-dosis text-3xl font-semibold text-start text-primary_700 mb-1 xl:text-5xl"
    >
      {{ name }}
    </h1>
    <p class="mb-4 text-primary_800 font-medium text-base xl:text-3xl xl:mb-8">
      {{ city }},
      <strong class="font-medium text-base xl:text-3xl">{{ area }}</strong>
    </p>
    <p class="text-primary_800 text-sm xl:text-2xl xl:mb-8">
      {{ description }}
    </p>
  </div>
</template>

<script setup>
const props = defineProps({
  name: String,
  city: String,
  area: String,
  description: String,
});
</script>

<style lang="scss" scoped></style>
