<template>
  <div class="rounded-t-xl relative">
    <img
      :src="src.at(imageIndex)"
      alt=""
      class="block min-w-full rounded-t-xl max-h-[218px] min-h-[218px]"
    />
    <button
      class="absolute p-1 rounded-full bg-primary_200 flex items-center justify-center top-1/2 transform -translate-y-1/2 right-2 opacity-80 transition ease-in-out delay-150 hover:scale-110 hover:drop-shadow hover:bg-white hover:opacity-100 duration-300"
      @click.prevent="slideRight(src)"
    >
      <img src="../assets/arrow-right.svg" alt="" />
    </button>
    <button
      class="absolute p-1 rounded-full bg-primary_200 flex items-center justify-center top-1/2 transform -translate-y-1/2 left-2 opacity-80 transition ease-in-out delay-150 hover:scale-110 hover:drop-shadow hover:bg-white hover:opacity-100 duration-300"
      @click.prevent="slideLeft(src)"
    >
      <img src="../assets/arrow-left.svg" alt="" />
    </button>
  </div>
</template>

<script setup>
import { ref, defineProps } from "vue";

const imageIndex = ref(0);

const props = defineProps({
  src: Array,
});

const slideRight = (src) => {
  imageIndex.value = (imageIndex.value + 1) % src.length;
};

const slideLeft = (src) => {
  imageIndex.value = (imageIndex.value - 1) % src.length;
};
</script>

<style scoped></style>
