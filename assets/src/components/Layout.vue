<template>
  <div class="flex flex-col h-screen">
    <Header />
    <slot name="content"></slot>
    <Footer />
  </div>
</template>

<script setup>
import Header from "./Header.vue";
import Footer from "./Footer.vue";
</script>
