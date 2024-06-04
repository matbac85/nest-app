<template>
  <Layout>
    <template #content>
      <main
        class="bg-primary_500 flex-1 flex flex-col justify-start items-center p-6 md:p-10"
      >
        <CabinList />
      </main>
    </template>
  </Layout>
</template>

<script setup>
import Layout from "../components/Layout.vue";
import CabinList from "../components/CabinList.vue";
</script>
<style scoped></style>
