<template>
  <article class="mb-4">
    <header>
      <h1 class="txt-title mb-1 text-start">
        {{ name }}
      </h1>
      <p class="mb-4 text-subtitle">
        {{ city }},
        <strong class="text-subtitle-strong">{{ area }}</strong>
      </p>
    </header>
    <section>
      <p class="text-body">
        {{ description }}
      </p>
    </section>
  </article>
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
