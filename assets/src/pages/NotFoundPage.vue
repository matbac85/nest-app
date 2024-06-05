<template>
  <Layout>
    <template #content>
      <main
        class="bg-primary_500 flex-1 flex flex-col justify-center items-center bg-image"
      ></main>
    </template>
  </Layout>
</template>

<script setup>
import Layout from "../components/Layout.vue";
</script>

<style scoped>
.bg-image {
  background-image: url("../assets/bg-404-mobile.svg");
  background-repeat: no-repeat;
  background-size: cover;
  background-size: contain;
  background-position: center;
}
@media (min-width: 40rem) {
  .bg-image {
    background-image: url("../assets/bg-404-desktop.svg");
    background-repeat: no-repeat;
    background-size: contain;
    background-position: center;
  }
}
</style>
