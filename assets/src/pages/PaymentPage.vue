<template>
  <Layout>
    <template #content>
      <main
        class="bg-primary_500 flex-1 flex flex-col-reverse justify-center py-10 items-center gap-10 bg-image md:flex-row"
      >
        <BookingSummary :query="route.query" :id="cabin.id" />
        <BookingPrice :query="route.query" :cabin="cabin" />
      </main>
    </template>
  </Layout>
</template>

<script setup>
import BookingSummary from "../components/BookingSummary.vue";
import Layout from "../components/Layout.vue";
import BookingPrice from "../components/BookingPrice.vue";
import { watch, ref } from "vue";
import { useRoute } from "vue-router";

const route = useRoute();
const cabin = ref({});
// watch the params of the route to fetch the data again
watch(() => route.query, fetchData, { immediate: true });

async function fetchData(id) {
  try {
    const response = await fetch(`/api/cabins/${route.params.id}`);
    cabin.value = await response.json();
  } catch (err) {
  } finally {
  }
}
</script>

<style lang="scss" scoped></style>
