<template>
  <div class="flex flex-col h-[100dvh] pt-[5rem]">
    <Header />
    <slot name="content"></slot>
    <Footer />
  </div>
</template>

<script setup>
import Header from "./Header.vue";
import Footer from "./Footer.vue";
</script>
