<template>
  <div>
    <form
      @submit.prevent="submit"
      novalidate
      class="bg-primary_200 rounded-xl drop-shadow grid grid-cols-1 gap-4 px-6 py-8 min-w-[21.4375rem] md:min-w-[48rem] md:grid-cols-2 mt-10 mb-10 md:m-0 md:gap-y-6"
    >
      <div>
        <label
          for="lastname"
          class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Nom</label
        ><input
          id="lastname"
          type="text"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500"
          v-model="form.lastname"
        />
      </div>
      <div>
        <label
          for="firstname"
          class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Prénom</label
        ><input
          id="firstname"
          type="text"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500"
          v-model="form.firstname"
        />
      </div>
      <div class="md:col-span-2">
        <label
          for="email"
          class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide md:col-span-2"
          >E-mail</label
        ><input
          type="email"
          name=""
          id="email"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500"
          v-model="form.email"
        />
      </div>
      <div>
        <label
          for="password"
          class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Mot de passe</label
        ><input
          type="password"
          name=""
          id="password"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500"
          v-model="form.password"
        />
      </div>
      <div>
        <label
          for="passwordconfirmation"
          class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Confirmer votre mot de passe</label
        ><input
          type="password"
          name=""
          id="passwordconfirmation"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500"
          v-model="form.passwordconfirmation"
        />
      </div>
      <button
        class="transition ease-in-out delay-150 block font-ubuntu text-base font-semibold text-primary_200 bg-primary_700 py-3 rounded-lg min-w-full tracking-wide hover:bg-primary_500 mt-2 hover:scale-105 duration-300 lg:px-4 md:col-start-2 md:mt-0"
      >
        S'inscrire
      </button>
    </form>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";

const router = useRouter();

const form = ref({
  lastname: "",
  firstname: "",
  email: "",
  password: "",
  passwordconfirmation: "",
});

const submit = async () => {
  const response = await fetch(`/api/users`, {
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    method: "POST", // *GET, POST, PUT, DELETE, etc.
    body: JSON.stringify(form.value), // body data type must match "Content-Type" header
  });
  console.log(response.status);
  if (response.status === 200) {
    router.push({ name: "Login", query: form.value });
  } else {
    console.log(await response.json());
  }
};
</script>

<style scoped></style>
