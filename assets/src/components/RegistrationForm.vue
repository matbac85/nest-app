<template>
  <div>
    <form
      @submit.prevent="submit"
      novalidate
      class="bg-primary_200 rounded-xl drop-shadow grid grid-cols-1 gap-4 px-6 py-8 min-w-[21.4375rem] md:min-w-[48rem] md:grid-cols-2 mt-10 mb-10 md:m-0 md:gap-y-6"
    >
      <div class="relative">
        <label
          for="lastname"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Nom</label
        ><input
          id="lastname"
          type="text"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          v-model="form.lastname"
          placeholder="Baclin"
        />
        <p
          v-if="lastnameError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ lastnameError }}
        </p>
      </div>
      <div class="relative">
        <label
          for="firstname"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Prénom</label
        ><input
          id="firstname"
          type="text"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          v-model="form.firstname"
          placeholder="Mathilde"
        />
        <p
          v-if="firstnameError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ firstnameError }}
        </p>
      </div>
      <div class="md:col-span-2 relative">
        <label
          for="email"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide md:col-span-2"
          >E-mail</label
        ><input
          type="email"
          name=""
          id="email"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          v-model="form.email"
          placeholder="exemple@email.com"
        />
        <p
          v-if="emailError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ emailError }}
        </p>
      </div>
      <div class="relative">
        <label
          for="password"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Mot de passe</label
        ><input
          type="password"
          name=""
          id="password"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          v-model="form.password"
          placeholder="MoTdEpAsSeCompliqué!"
        />
        <p
          v-if="passwordError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ passwordError }}
        </p>
      </div>
      <div class="relative">
        <label
          for="passwordconfirmation"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Confirmer votre mot de passe</label
        ><input
          type="password"
          name=""
          id="passwordconfirmation"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          v-model="form.password_confirmation"
          placeholder="MoTdEpAsSeCompliqué!"
        />
        <p
          v-if="passwordconfirmationError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ passwordconfirmationError }}
        </p>
      </div>
      <button
        class="transition ease-in-out delay-150 block text-base font-semibold text-primary_200 bg-primary_700 py-3 rounded-lg min-w-full tracking-wide hover:bg-primary_500 mt-4 hover:scale-105 duration-300 lg:px-4 md:col-start-2 md:mt-2 md place-self-end md:max-w-fit"
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

const lastnameError = ref("");
const firstnameError = ref("");
const emailError = ref("");
const passwordError = ref("");
const passwordconfirmationError = ref("");

const handleBackendErrors = (responseData) => {
  if (responseData.password) {
    passwordError.value = responseData.password[0];
  }
  if (responseData.email) {
    emailError.value = responseData.email[0];
  }
  if (responseData.lastname) {
    lastnameError.value = responseData.lastname[0];
  }
  if (responseData.firstname) {
    firstnameError.value = responseData.firstname[0];
  }
  if (responseData.password_confirmation) {
    passwordconfirmationError.value = responseData.password_confirmation[0];
  }
};

const submit = async () => {
  lastnameError.value = "";
  firstnameError.value = "";
  emailError.value = "";
  passwordError.value = "";
  passwordconfirmationError.value = "";

  const response = await fetch(`/api/users`, {
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(form.value),
  });

  const responseData = await response.json();

  if (response.status === 200) {
    router.push({ name: "Login", query: form.value });
  } else {
    handleBackendErrors(responseData);
  }
};
</script>

<style scoped></style>
