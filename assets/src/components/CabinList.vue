<template>
  <div v-if="cabins">
    <ul
      class="grid gap-4 md:grid-cols-2 lg:grid-cols-4 lg:gap-6 xl:grid-cols-5"
      v-if="cabins.length > 0"
    >
      <li v-for="cabin in cabins" :key="cabin.id">
        <CabinDetails
          :name="cabin.name"
          :src="cabin.images"
          :city="cabin.city"
          :price="cabin.price"
          :id="cabin.id"
          :query="route.query"
          :favorite="cabin.favorite"
        />
      </li>
    </ul>
    <ErrorMessage v-else />
  </div>
</template>

<script setup>
import { watch } from "vue";
import { useRoute } from "vue-router";
import { useFetchData } from "../composables/useFetchData";
import CabinDetails from "./CabinDetails.vue";
import ErrorMessage from "../components/ErrorMessage.vue";

const route = useRoute();
const { loading, cabins, error, fetchData } = useFetchData();

// watch the params of the route to fetch the data again
watch(() => route.query, fetchData, { immediate: true });
</script>

<style scoped></style>
