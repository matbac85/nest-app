<template>
  <div class="bg-primary_200 rounded-xl drop-shadow px-6 py-8">
    <h2 class="font-dosis font-semibold text-xl text-primary_700 mb-4">
      Mes favoris
    </h2>
    <ul class="grid gap-y-4 md:grid-cols-4 md:gap-x-4">
      <li
        v-for="(favorite, index) in visibleFavorites"
        :key="index"
        class="flex flex-col shadow-lg rounded-xl md:w-60"
      >
        <img
          :src="favorite.cabin.images[0]"
          alt=""
          class="w-full h-44 object-cover rounded-t-xl"
        />
        <div class="p-4 flex flex-col justify-between flex-grow">
          <h2 class="text-primary_700 font-dosis font-bold text-xl">
            {{ favorite.cabin.name }}
          </h2>
          <p class="text-primary_800 font-normal text-base">
            {{ favorite.cabin.city }}
          </p>
        </div>
      </li>
      <button
        @click="toggleShowAll"
        class="font-medium underline mt-2 text-primary_700 md:col-span-4 flex justify-end"
      >
        {{ showAll ? "Voir moins" : "Voir plus" }}
      </button>
    </ul>
  </div>
</template>

<script setup>
import { ref, computed } from "vue";

const props = defineProps({
  favorites: Array,
});

const showAll = ref(false);
const maxVisible = ref(4);

const toggleShowAll = () => {
  showAll.value = !showAll.value;
};

const visibleFavorites = computed(() => {
  if (!props.favorites || !Array.isArray(props.favorites)) {
    return [];
  } else if (showAll.value) {
    return props.favorites;
  } else {
    return props.favorites.slice(0, maxVisible.value);
  }
});
</script>

<style lang="scss" scoped></style>
