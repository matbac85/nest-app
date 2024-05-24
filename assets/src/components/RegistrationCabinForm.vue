<template>
  <div>
    <form
      @submit.prevent="submit"
      novalidate
      class="bg-primary_200 rounded-xl drop-shadow grid grid-cols-1 gap-4 px-6 py-8 min-w-[21.4375rem] md:min-w-[48rem] md:grid-cols-2 mt-10 mb-10 md:m-0 md:gap-y-6"
    >
      <div class="md:col-span-2">
        <label
          for="cabinname"
          class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Nom de la cabane</label
        ><input
          id="cabinname"
          type="text"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500"
        />
      </div>
      <div>
        <label
          for="city"
          class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Localité</label
        ><input
          id="city"
          type="text"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500"
        />
      </div>
      <div>
        <label
          for="area"
          class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide md:col-span-2"
          >Région</label
        ><input
          type="text"
          name=""
          id="area"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500"
        />
      </div>
      <div>
        <label
          for="travellers"
          class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Nombre de voyageurs</label
        ><input
          type="number"
          name=""
          id="travellers"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500"
        />
      </div>
      <div>
        <label
          for="price"
          class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Prix par nuit</label
        ><input
          type="number"
          name=""
          id="price"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500"
        />
      </div>
      <button
        class="transition ease-in-out delay-150 block font-ubuntu text-base font-semibold text-primary_200 bg-primary_700 py-3 rounded-lg min-w-full tracking-wide hover:bg-primary_500 mt-2 hover:scale-105 duration-300 lg:px-4 md:col-start-2 md:mt-0"
      >
        Enregistrer
      </button>
    </form>
  </div>
</template>

<script setup></script>

<style lang="scss" scoped></style>
