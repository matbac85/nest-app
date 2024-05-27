<template>
  <Layout>
    <template #content>
      <main
        class="bg-primary_300 flex-1 flex flex-col items-start justify-start md:p-20"
      >
        <CabinPicturesSlider :pictures="cabin.images" class="mb-6" />
        <h1
          class="font-dosis text-2xl font-semibold text-start text-primary_700 md:text-3xl"
        >
          {{ cabin.name }}
        </h1>
        <p>{{ cabin.description }}</p>
      </main>
    </template>
  </Layout>
</template>

<script setup>
import Layout from "../components/Layout.vue";
import { useRoute } from "vue-router";
import { watch, ref } from "vue";
import CabinPicturesSlider from "../components/CabinPicturesSlider.vue";

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
