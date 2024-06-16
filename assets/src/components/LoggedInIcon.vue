<template>
  <div>
    <p class="bg-primary_500 rounded-full w-fit h-fit p-2">
      {{ userStore.user.firstname[0] }}{{ userStore.user.lastname[0] }}
    </p>
  </div>
</template>

<script setup>
import { userStore } from "../stores/userStore";
</script>

<style lang="scss" scoped></style>
