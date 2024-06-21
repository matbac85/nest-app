<template>
  <section class="rounded-t-xl relative group">
    <img
      v-if="src"
      :src="src.at(imageIndex)"
      alt=""
      class="block min-w-full rounded-t-xl max-h-[218px] min-h-[218px]"
    />
    <button
      class="absolute top-4 p-1 right-2 rounded-full bg-primary_800 bg-opacity-70 w-8 h-8 hover:scale-110"
      @click.prevent="toggleFavorite"
      v-if="userStore.user"
    >
      <img
        :src="toggleImageSrc(favorite)"
        alt=""
        class="min-w-full min-h-full"
      />
    </button>
    <button class="btn-slide-lateral right-2" @click.prevent="slideRight(src)">
      <img src="../assets/arrow-right.svg" alt="" />
    </button>
    <button
      v-if="imageIndex != 0"
      class="btn-slide-lateral left-2"
      @click.prevent="slideLeft(src)"
    >
      <img src="../assets/arrow-left.svg" alt="" />
    </button>
  </section>
</template>

<script setup>
import { defineProps } from "vue";
import useFavorite from "../composables/useFavorite";
import { useSlide } from "../composables/useSlide";
import { userStore } from "../stores/userStore";

const props = defineProps({
  id: Number,
  src: Array,
  favorite: Boolean,
});

const { imageIndex, slideRight, slideLeft } = useSlide(props.src);
const { favorite, toggleImageSrc, setFavorite } = useFavorite(props.favorite);

const toggleFavorite = () => {
  setFavorite(props.id);
};
</script>

<style scoped></style>
