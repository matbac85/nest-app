import { ref } from "vue";

const useSlide = (pictures) => {
  const imageIndex = ref(0);

  const slideRight = () => {
    imageIndex.value = (imageIndex.value + 1) % pictures.length;
  };

  const slideLeft = () => {
    imageIndex.value =
      (imageIndex.value - 1 + pictures.length) % pictures.length;
  };

  return {
    imageIndex,
    slideRight,
    slideLeft,
  };
};

export { useSlide };
