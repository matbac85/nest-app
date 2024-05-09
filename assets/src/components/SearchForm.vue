<template>
  <div>
    <form novalidate class="bg-primary_200 px-4 py-6 min-w-[21.4375rem]">
      <fieldset>
        <input type="checkbox" name="wallonia" id="" />
        <input type="checkbox" name="flanders" id="" />
        <input type="checkbox" name="brussels" id="" />
      </fieldset>
      <fieldset class="flex flex-col">
        <Datepicker
          v-model="date"
          :range="{ partialRange: false }"
          :enable-time-picker="false"
          input-class-name="dp-custom-input"
        />
        <input
          type="number"
          name="travelers"
          id=""
          class="py-2 px-[2.5rem] rounded-full"
        />
      </fieldset>
      <button>rechercher</button>
    </form>
  </div>
</template>

<script setup>
import { ref } from "vue";
import Datepicker from "@vuepic/vue-datepicker";
import "@vuepic/vue-datepicker/dist/main.css";

const date = ref();
</script>

<style>
.dp-custom-input {
  border: 0;
  border-radius: 999px;
  padding: 8px 40px;
}
</style>
