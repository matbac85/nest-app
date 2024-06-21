<template>
  <div
    class="min-w-full flex justify-between items-end gap-3 md:justify-start mb-10"
  >
    <div class="text-base flex justify-center">
      <p class="txt-body">
        <strong class="txt-body-strong">{{ props.price }} €</strong>
        par nuit
      </p>
    </div>
    <RouterLink
      :to="{ name: 'Payment', params: { id: props.id }, query: props.query }"
      class="btn-primary text-center md:w-fit"
    >
      Demande de réservation
    </RouterLink>
  </div>
</template>

<script setup>
import { RouterLink } from "vue-router";

const props = defineProps({
  id: Number,
  query: Object,
  price: Number,
});
</script>
