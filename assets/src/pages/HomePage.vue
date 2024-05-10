<template>
  <Layout>
    <template #content>
      <Banner />
      <SearchForm />
    </template>
  </Layout>
</template>

<script setup>
import Layout from "../components/Layout.vue";
import SearchForm from "../components/SearchForm.vue";
import Banner from "../components/Banner.vue";
</script>
