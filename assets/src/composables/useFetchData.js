import { ref } from "vue";
import { useRoute } from "vue-router";
import { userStore } from "../stores/userStore";

const useFetchData = () => {
  const route = useRoute();
  const loading = ref(false);
  const cabins = ref(null);
  const error = ref(null);

  const fetchData = async () => {
    //error.value = cabins.value = null;
    loading.value = true;

    let headers = {
      Accept: "application/json",
      "Content-Type": "application/json",
    };
    if (userStore.user) {
      headers.authorization = `Bearer ${userStore.user.jwt}`;
    }

    try {
      const response = await fetch(
        `/api/cabins?max_guests=${route.query.travellers || ""}&area=${
          route.query.area || ""
        }&start_date=${route.query.startDate || ""}&end_date=${
          route.query.endDate || ""
        }`,
        {
          headers: headers,
        }
      );
      const jsonResponse = await response.json();
      cabins.value = jsonResponse;
    } catch (err) {
      error.value = err.toString();
    } finally {
      loading.value = false;
    }
  };

  return {
    loading,
    cabins,
    error,
    fetchData,
  };
};

export { useFetchData };
