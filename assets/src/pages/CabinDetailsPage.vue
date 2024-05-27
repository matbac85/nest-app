<template>
  <Layout>
    <template #content>
      <main
        class="bg-primary_300 flex-1 flex flex-col items-center justify-start md:p-10"
      >
        <CabinPicturesDisplayer :pictures="cabin.images" class="mb-6" />
        <div class="px-6 mb-4 md:px-0">
          <h1
            class="font-dosis text-3xl font-semibold text-start text-primary_700 mb-1"
          >
            {{ cabin.name }}
          </h1>
          <p class="mb-4 text-primary_800 font-medium text-base">
            {{ cabin.city }},
            <strong class="font-medium text-base">{{ cabin.area }}</strong>
          </p>
          <p class="text-primary_800 text-sm">{{ cabin.description }}</p>
        </div>
        <OrderForm class="px-6 md:px-0" />
      </main>
    </template>
  </Layout>
</template>

<script setup>
import Layout from "../components/Layout.vue";
import { useRoute } from "vue-router";
import { watch, ref } from "vue";
import CabinPicturesDisplayer from "../components/CabinPicturesDisplayer.vue";
import OrderForm from "../components/OrderForm.vue";

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
