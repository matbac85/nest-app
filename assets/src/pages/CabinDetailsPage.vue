<template>
  <Layout>
    <template #content>
      <main
        class="bg-primary_300 flex-1 flex flex-col justify-start p-6 md:px-36 md:py-10 xl:py-20 xl:px-[15rem] md:flex-row"
      >
        <div>
          <CabinPicturesDisplayer :pictures="cabin.images" />
          <CabinDetailsDescription
            :name="cabin.name"
            :city="cabin.city"
            :area="cabin.area"
            :description="cabin.description"
          />
          <OrderForm :id="cabin.id" :query="route.query" :price="cabin.price" />
          <CommentForm :cabin="cabin" v-if="userStore.user" />
          <CommentsSection :cabin="cabin" v-if="userStore.user" />
        </div>
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
import CommentForm from "../components/CommentForm.vue";
import CommentsSection from "../components/CommentsSection.vue";
import { userStore } from "../stores/userStore";

const route = useRoute();
const cabin = ref({});
const commentsKey = ref(0);
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

<style scoped></style>
