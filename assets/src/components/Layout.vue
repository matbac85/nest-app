<template>
  <div>
    <Header />
    <main
      class="bg-primary_700 flex flex-col items-center justify-center min-h-screen"
    >
      <slot name="content"></slot>
    </main>
    <Footer class="hidden" />
  </div>
</template>

<script setup>
import Header from "./Header.vue";
</script>
