<template>
  <div v-if="userStore.user">
    <p
      class="bg-primary_500 rounded-full w-14 h-14 flex justify-center items-center"
    >
      {{ userStore.user.firstname[0] }}{{ userStore.user.lastname[0] }}
    </p>
  </div>
</template>

<script setup>
import { userStore } from "../stores/userStore";
</script>

<style lang="scss" scoped></style>
