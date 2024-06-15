<template>
  <div>
    <ul class="flex flex-col items-start gap-4 w-full">
      <li v-for="(comment, index) in props.cabin.comments" :key="index">
        <div class="w-full flex items-center justify-between">
          <p
            class="inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white font-semibold"
          >
            <img
              class="mr-2 w-6 h-6 rounded-full"
              src="https://flowbite.com/docs/images/people/profile-picture-2.jpg"
              alt="Michael Gough"
            />{{ comment.user_firstname }} {{ comment.user_lastname }}
          </p>
          <p class="text-sm text-gray-600 dark:text-gray-400">
            <time pubdate datetime="2022-02-08" title="February 8th, 2022">{{
              formatDate(comment.created_at)
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
const props = defineProps({
  cabin: Object,
});

const formatDate = (dateString) => {
  const date = new Date(dateString);
  const day = date.getDate().toString().padStart(2, "0");
  const month = (date.getMonth() + 1).toString().padStart(2, "0");
  const year = date.getFullYear();
  return `${day}/${month}/${year}`;
};
</script>

<style lang="scss" scoped></style>
