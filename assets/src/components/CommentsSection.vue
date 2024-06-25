<template>
  <ul
    v-if="props.cabin.comments && props.cabin.comments.length > 0"
    class="grid grid-cols-1 gap-y-4 gap-x-4 md:grid-cols-2 mt-10"
  >
    <li
      v-for="(comment, index) in props.cabin.comments"
      :key="index"
      class="bg-primary_200 rounded-xl shadow-lg p-4"
    >
      <div class="w-full flex items-center justify-between">
        <figure class="inline-flex gap-4 mb-4 items-center">
          <CommentUserIcon
            :firstname="comment.user_firstname"
            :lastname="comment.user_lastname"
          />
          <figcaption>
            <h2 class="txt-body-strong -mb-1">
              {{ comment.user_firstname }} {{ comment.user_lastname }}
            </h2>
            <p class="txt-body">
              <time pubdate datetime="2022-02-08" title="February 8th, 2022">{{
                useDateFormat(comment.created_at)
              }}</time>
            </p>
          </figcaption>
        </figure>
      </div>
      <p class="txt-body ml-2">
        {{ comment.text }}
      </p>
    </li>
  </ul>
</template>

<script setup>
import LoggedInIcon from "../components/LoggedInIcon.vue";
import { useDateFormat } from "../composables/useDateFormat";
import CommentUserIcon from "./CommentUserIcon.vue";

const props = defineProps({
  cabin: Object,
});
</script>

<style lang="scss" scoped></style>
