<template>
  <div>{{ props.userData }}</div>
</template>

<script setup>
const props = defineProps({
  userData: Object,
});
</script>

<style lang="scss" scoped></style>
