<template>
  <Layout>
    <template #content>
      <main
        class="bg-primary_500 flex-1 flex flex-col justify-center items-center bg-image px-4 py-10"
      >
        <RegistrationForm />
      </main>
    </template>
  </Layout>
</template>

<script setup>
import Layout from "../components/Layout.vue";
import RegistrationForm from "../components/RegistrationForm.vue";
</script>

<style lang="scss" scoped></style>
