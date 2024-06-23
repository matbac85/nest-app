<template>
  <section>
    <!-- Mobile -->
    <div
      class="relative min-w-screen mb-6 overflow-hidden rounded-xl md:hidden"
    >
      <figure>
        <img
          v-if="pictures"
          :src="pictures.at(imageIndex)"
          alt=""
          class="object-cover rounded-xl"
        />
      </figure>
      <button
        class="absolute p-1 rounded-full bg-primary_200 flex items-center justify-center top-1/2 transform -translate-y-1/2 right-2 opacity-80 transition ease-in-out delay-150 hover:scale-110 hover:drop-shadow hover:bg-white hover:opacity-100 duration-300"
        @click.prevent="slideRight(pictures)"
        aria-label="Next Image"
      >
        <img src="/src/assets/images/arrow-right.svg" alt="" />
      </button>
      <button
        class="absolute p-1 rounded-full bg-primary_200 flex items-center justify-center top-1/2 transform -translate-y-1/2 left-2 opacity-80 transition ease-in-out delay-150 hover:scale-110 hover:drop-shadow hover:bg-white hover:opacity-100 duration-300"
        @click.prevent="slideLeft(pictures)"
        aria-label="Previous Image"
      >
        <img src="/src/assets/images/arrow-left.svg" alt="" />
      </button>
    </div>

    <!-- Desktop -->
    <div
      class="hidden md:rounded-xl md:grid md:grid-cols-4 md:grid-rows-2 md:gap-2 md:max-h-[400px] mb-6"
    >
      <figure
        v-for="(picture, index) in pictures"
        :key="index"
        :class="getClass(index, pictures)"
      >
        <img
          :src="picture"
          alt=""
          class="w-full h-full object-cover rounded-xl"
        />
      </figure>
    </div>
  </section>
</template>

<script setup>
import { defineProps, ref } from "vue";

const props = defineProps({
  pictures: Array,
});

const imageIndex = ref(0);

const slideRight = (pictures) => {
  imageIndex.value = (imageIndex.value + 1) % pictures.length;
};
const slideLeft = (pictures) => {
  imageIndex.value = (imageIndex.value - 1) % pictures.length;
};

const getClass = (index) => {
  if (index === 0) {
    return `md:col-span-2 md:row-span-2 md:rounded-l-xl`;
  }

  if (index === 2) {
    return `md:rounded-tr-xl`;
  }

  if (index === 4) {
    return `md:rounded-br-xl`;
  }
};
</script>

<style scoped></style>
