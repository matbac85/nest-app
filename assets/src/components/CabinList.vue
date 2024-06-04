<template>
  <div>
    <ul
      class="grid gap-4 md:grid-cols-2 lg:grid-cols-4 lg:gap-6 xl:grid-cols-5"
    >
      <li v-for="cabin in cabins" :key="cabin.id">
        <CabinDetails
          :name="cabin.name"
          :src="cabin.images"
          :city="cabin.city"
          :price="cabin.price"
          :id="cabin.id"
        />
      </li>
    </ul>
  </div>
</template>

<script setup>
import { ref, watch } from "vue";
import { useRoute } from "vue-router";
import CabinDetails from "./CabinDetails.vue";

const route = useRoute();

const loading = ref(false);
const cabins = ref(null);
const error = ref(null);

// const props = defineProps({ title: String });

// watch the params of the route to fetch the data again
watch(() => route.query, fetchData, { immediate: true });

async function fetchData(id) {
  error.value = cabins.value = null;
  loading.value = true;
  console.log("load");
  try {
    const response = await fetch(
      `/api/cabins?max_guests=${route.query.travellers || ""}&area=${
        route.query.area || ""
      }&date=${route.query.date || ""}`
    );
    cabins.value = await response.json();
  } catch (err) {
    error.value = err.toString();
  } finally {
    loading.value = false;
  }
}
</script>

<style scoped></style>
