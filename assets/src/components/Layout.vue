<template>
  <div class="flex flex-col h-screen">
    <Header />
    <main
      class="bg-primary_500 flex-1 flex flex-col justify-center items-center bg-image"
    >
      <slot name="content"></slot>
    </main>
    <Footer class="hidden md:block" />
  </div>
</template>

<script setup>
import Header from "./Header.vue";
</script>

<style>
@media (min-width: 40rem) {
  .bg-image {
    background-image: url("../assets/bg-desktop.svg");
    background-repeat: no-repeat;
    background-size: cover;
  }
}
</style>
