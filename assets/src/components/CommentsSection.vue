<template>
  <div>
    <ul class="flex flex-col items-start gap-4 w-full">
      <li v-for="(comment, index) in props.cabin.comments" :key="index">
        <div class="w-full flex items-center justify-between">
          <p
            class="inline-flex gap-2 mb-2 items-center mr-3 text-sm text-gray-900 font-semibold"
          >
            <LoggedInIcon />{{ comment.user_firstname }}
            {{ comment.user_lastname }}
          </p>
          <p class="text-sm text-gray-600 dark:text-gray-400">
            <time pubdate datetime="2022-02-08" title="February 8th, 2022">{{
              useDateFormat(comment.created_at)
            }}</time>
          </p>
        </div>
        <p class="text-gray-500 dark:text-gray-400">
          {{ comment.text }}
        </p>
      </li>
    </ul>
  </div>
</template>

<script setup>
import LoggedInIcon from "../components/LoggedInIcon.vue";
import { useDateFormat } from "../composables/useDateFormat";

const props = defineProps({
  cabin: Object,
});
</script>

<style lang="scss" scoped></style>
