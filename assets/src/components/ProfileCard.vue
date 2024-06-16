<template>
  <div
    class="bg-primary_200 rounded-xl drop-shadow px-6 py-8 flex gap-4 items-center"
  >
    <p class="bg-primary_500 rounded-full w-fit h-fit p-2">
      {{ props.userData.firstname[0] }}{{ props.userData.lastname[0] }}
    </p>
    <div>
      <h2 class="text-lg font-medium text-primary_800">
        {{ props.userData.firstname }} {{ props.userData.lastname }}
      </h2>
      <p class="text-sm font-normal text-primary_800">
        {{ props.userData.email }}
      </p>
    </div>
  </div>
</template>

<script setup>
const props = defineProps({
  userData: Object,
});
</script>

<style lang="scss" scoped></style>
