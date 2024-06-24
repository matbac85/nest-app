import { ref } from "vue";
import { userStore } from "../stores/userStore";

const useFavorite = (initialFavoriteState) => {
  const favorite = ref(initialFavoriteState);

  const toggleImageSrc = () => {
    return favorite.value
      ? "/src/images/favorite-filled.svg"
      : "/src/images/favorite-border.svg";
  };

  const setFavorite = async (id) => {
    try {
      const response = await fetch(`/api/cabins/${id}/favorites/toggle`, {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          authorization: `Bearer ${userStore.user.jwt}`,
        },
      });

      if (response.status === 200) {
        const newFavorite = await response.json();
        favorite.value = newFavorite;
      } else {
        console.error("Erreur lors de la modification du favori");
      }
    } catch (error) {
      console.error("Erreur lors de la modification du favori :", error);
    }
  };

  return {
    favorite,
    toggleImageSrc,
    setFavorite,
  };
};

export default useFavorite;
