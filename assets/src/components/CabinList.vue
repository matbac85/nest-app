<template>
  <div>
    <ul class="grid m-6 gap-4 lg:grid-cols-4 lg:gap-4 lg:m-10">
      <li v-for="cabin in cabins" :key="cabin.id">
        <CabinDetails
          :name="cabin.name"
          :src="cabin.images"
          :city="cabin.city"
          :price="cabin.price"
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
watch(() => route.params, fetchData, { immediate: true });

async function fetchData(id) {
  error.value = cabins.value = null;
  loading.value = true;
  console.log("load");
  try {
    const response = await fetch("/api/cabins");
    cabins.value = await response.json();
  } catch (err) {
    error.value = err.toString();
  } finally {
    loading.value = false;
  }
}
</script>

<style scoped></style>
