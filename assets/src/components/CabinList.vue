<template>
  <div>
    <ul class="grid grid-cols-4 gap-4 m-10">
      <li v-for="cabin in cabins" :key="cabin.id">
        <CabinDetails :name="cabin.name" :src="cabin.images[0]" />
      </li>
    </ul>
    {{ cabins }}
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
