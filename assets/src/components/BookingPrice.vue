<template>
  <div class="bg-primary_200 drop-shadow grid grid-cols-1 px-10 py-8">
    <div class="flex flex-row gap-4">
      <img
        v-if="cabin.images"
        :src="cabin.images[0]"
        alt=""
        class="w-20 h-20 bg-primary_700 rounded-lg object-cover"
      />
      <div>
        <h2
          class="font-dosis text-xl font-semibold text-start text-primary_800"
        >
          {{ cabin.name }}
        </h2>
        <p>{{ cabin.price }} € par nuit</p>
      </div>
    </div>
    <hr class="my-6 text-primary_300 border-1" />
    <div>
      <h2
        class="font-dosis text-xl font-semibold text-start text-primary_800 mb-6"
      >
        Détails du prix
      </h2>
      <div class="flex flex-row justify-between">
        <p>{{ cabin.price }} € x {{ numberOfNights }} nuits</p>
        <p>{{ totalPrice }} €</p>
      </div>
      <hr class="my-6 text-primary_300 border-1" />
      <div class="flex flex-row justify-between">
        <p>Taxes</p>
        <p>{{ taxAmount.toFixed(1) }} €</p>
      </div>
      <hr class="my-6 text-primary_300 border-1" />
      <div class="flex flex-row justify-between">
        <p>Total</p>
        <p>{{ totalWithTax }} €</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from "vue";
import { differenceInDays, parseISO } from "date-fns";

const props = defineProps({
  query: Object,
  cabin: Object,
});

const form = {
  start_date: props.query.startDate,
  end_date: props.query.endDate,
  travellers: props.query.travellers,
};

const numberOfNights = computed(() => {
  const startDate = parseISO(form.start_date);
  const endDate = parseISO(form.end_date);
  return differenceInDays(endDate, startDate);
});

const totalPrice = computed(() => {
  return numberOfNights.value * props.cabin.price;
});

const taxAmount = computed(() => {
  return totalPrice.value * 0.21;
});

const totalWithTax = computed(() => {
  return totalPrice.value + taxAmount.value;
});
</script>

<style lang="scss" scoped></style>
