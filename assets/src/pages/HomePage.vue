<template>
  <Layout>
    <template #content>
      <main
        class="bg-primary_500 flex-1 flex flex-col justify-center items-center bg-image px-4"
      >
        <Banner />
        <SearchForm />
      </main>
    </template>
  </Layout>
</template>

<script setup>
import Layout from "../components/Layout.vue";
import SearchForm from "../components/SearchForm.vue";
import Banner from "../components/Banner.vue";
</script>

<style>
@media (min-width: 40rem) {
  .bg-image {
    background-image: url("/images/bg-desktop.svg");
    background-repeat: no-repeat;
    background-size: cover;
  }
}
</style>
