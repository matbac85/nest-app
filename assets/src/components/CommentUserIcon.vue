<template>
  <div v-if="userStore.user">
    <p
      class="bg-primary_500 rounded-full w-12 h-12 flex justify-center items-center"
    >
      {{ props.firstname[0] }}{{ props.lastname[0] }}
    </p>
  </div>
</template>

<script setup>
import { userStore } from "../stores/userStore";

const props = defineProps({
  firstname: String,
  lastname: String,
});
</script>

<style lang="scss" scoped></style>
