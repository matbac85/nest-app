const slideRight = (pictures, imageIndex) => {
  console.log(imageIndex);
  return (imageIndex + 1) % pictures.length;
};

const slideLeft = (pictures, imageIndex) => {
  return (imageIndex - 1 + pictures.length) % pictures.length;
};

export { slideRight, slideLeft };
