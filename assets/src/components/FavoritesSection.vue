<template>
  <section class="bg-primary_200 rounded-xl drop-shadow px-6 py-8 min-w-full">
    <h2 class="txt-title mb-4">Mes favoris</h2>
    <ul
      class="grid gap-y-4 md:grid-cols-2 lg:grid-cols-4 md:gap-x-4"
      v-if="visibleFavorites.length > 0"
    >
      <li
        v-for="(favorite, index) in visibleFavorites"
        :key="index"
        class="flex flex-col shadow-lg rounded-xl"
      >
        <img
          :src="favorite.cabin.images[0]"
          alt=""
          class="w-full h-44 object-cover rounded-t-xl"
        />
        <div class="p-4 flex flex-col justify-between flex-grow">
          <h2 class="txt-h2">
            {{ favorite.cabin.name }}
          </h2>
          <p class="txt-body">
            {{ favorite.cabin.city }}
          </p>
        </div>
      </li>
      <div
        v-if="showButton"
        class="md:col-span-2 lg:col-span-4 flex justify-end"
      >
        <button
          @click="toggleShowAll"
          class="txt-body-strong underline mt-2 text-primary_700 hover:text-primary_500"
        >
          {{ showAll ? "Voir moins" : "Voir plus" }}
        </button>
      </div>
    </ul>
    <EmptyFavoritesSection v-else />
  </section>
</template>

<script setup>
import { ref, computed } from "vue";
import EmptyFavoritesSection from "./EmptyFavoritesSection.vue";

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

const showButton = computed(() => {
  if (props.favorites || Array.isArray(props.favorites)) {
    return props.favorites.length > maxVisible.value;
  }
});
</script>

<style lang="scss" scoped></style>
