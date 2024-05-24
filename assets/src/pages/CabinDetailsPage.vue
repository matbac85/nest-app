<template>
  <Layout>
    <template #content>
      <main
        class="bg-primary_300 flex-1 flex flex-col justify-center items-center"
      >
        <h1>{{ cabin.name }}</h1>
      </main>
    </template>
  </Layout>
</template>

<script setup>
import Layout from "../components/Layout.vue";
import { useRoute } from "vue-router";
import { watch, ref } from "vue";

const route = useRoute();
const cabin = ref({});
// watch the params of the route to fetch the data again
watch(() => route.query, fetchData, { immediate: true });

async function fetchData(id) {
  console.log(route.params);
  try {
    const response = await fetch(`/api/cabins/${route.params.id}`);
    cabin.value = await response.json();
    console.log(cabin.value);
  } catch (err) {
  } finally {
  }
}
</script>

<style scoped></style>
