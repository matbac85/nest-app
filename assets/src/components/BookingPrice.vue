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
        <p>{{ props.cabin.price }} € par nuit</p>
      </div>
    </div>
    <hr class="my-6 text-primary_300 border-1" />
    <div>
      <h2
        class="font-dosis text-xl font-semibold text-start text-primary_800 mb-6"
      >
        Détail du prix
      </h2>
      <div class="flex flex-row justify-between">
        <p>{{ pricePerNight }} € x {{ numberOfNights }} nuits</p>
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
        <p>{{ totalWithTax.toFixed(1) }} €</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watch } from "vue";
import {
  useNumberOfNights,
  useTotalPrice,
  useTaxAmount,
  useTotalWithTax,
} from "../composables/useBookingPrice";

const props = defineProps({
  query: Object,
  cabin: Object,
});

const pricePerNight = ref(props.cabin.price);
const numberOfNights = ref(0);
const totalPrice = ref(0);
const taxAmount = ref(0);
const totalWithTax = ref(0);

watch(
  () => props.cabin,
  () => {
    pricePerNight.value = props.cabin.price;
    numberOfNights.value = useNumberOfNights(
      props.query.startDate,
      props.query.endDate
    );
    totalPrice.value = useTotalPrice(numberOfNights.value, props.cabin.price);
    taxAmount.value = useTaxAmount(totalPrice.value);
    totalWithTax.value = useTotalWithTax(totalPrice.value, taxAmount.value);
  },
  { immediate: true }
);
</script>

<style lang="scss" scoped></style>
