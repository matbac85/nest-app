<template>
  <figure
    class="bg-primary_200 rounded-xl drop-shadow px-6 py-8 flex gap-4 items-center min-w-full"
  >
    <LoggedInIcon />
    <figcaption>
      <h2 class="txt-body-strong">
        {{ props.userData.firstname }} {{ props.userData.lastname }}
      </h2>
      <p class="txt-body">
        {{ props.userData.email }}
      </p>
    </figcaption>
  </figure>
</template>

<script setup>
import LoggedInIcon from "./LoggedInIcon.vue";

const props = defineProps({
  userData: Object,
});
</script>

<style lang="scss" scoped></style>
