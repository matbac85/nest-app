<template>
  <Layout>
    <template #content>
      <main
        class="bg-primary_300 flex-1 flex flex-col justify-start p-6 md:p-10 xl:p-20"
      >
        <CabinPicturesDisplayer :pictures="cabin.images" class="mb-6" />
        <CabinDetailsDescription
          :name="cabin.name"
          :city="cabin.city"
          :area="cabin.area"
          :description="cabin.description"
        />
        <OrderForm />
      </main>
    </template>
  </Layout>
</template>

<script setup>
import Layout from "../components/Layout.vue";
import { useRoute } from "vue-router";
import { watch, ref } from "vue";
import CabinPicturesDisplayer from "../components/CabinPicturesDisplayer.vue";
import CabinDetailsDescription from "../components/CabinDetailsDescription.vue";
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
