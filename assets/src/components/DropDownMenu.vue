<template>
  <div
    class="absolute md:right-6 z-10 mt-1 w-fit origin-top-right rounded-xl bg-primary_200 shadow-lg ring-inset ring-primary_300 ring-1"
    role="menu"
    aria-orientation="vertical"
    aria-labelledby="menu-button"
    tabindex="-1"
  >
    <div class="py-2" role="none">
      <slot></slot>
    </div>
  </div>
</template>

<script setup></script>

<style scoped></style>
