<template>
  <div
    class="bg-primary_200 rounded-xl drop-shadow px-6 py-8 flex gap-4 items-center"
  >
    <LoggedInIcon />
    <div>
      <h2 class="text-base font-medium text-primary_800">
        {{ props.userData.firstname }} {{ props.userData.lastname }}
      </h2>
      <p class="text-sm font-normal text-primary_800">
        {{ props.userData.email }}
      </p>
    </div>
  </div>
</template>

<script setup>
import LoggedInIcon from "./LoggedInIcon.vue";

const props = defineProps({
  userData: Object,
});
</script>

<style lang="scss" scoped></style>
