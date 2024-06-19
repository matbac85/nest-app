import { differenceInDays, parseISO } from "date-fns";

const useTotalPrice = (numberOfNights, pricePerNight) => {
  return numberOfNights * pricePerNight;
};

const useNumberOfNights = (startDate, endDate) => {
  const start = parseISO(startDate);
  const end = parseISO(endDate);
  return differenceInDays(end, start);
};

const useTaxAmount = (totalPrice) => {
  return totalPrice * 0.21;
};

const useTotalWithTax = (totalPrice, TaxAmount) => {
  return totalPrice + TaxAmount;
};

export { useTotalPrice, useNumberOfNights, useTaxAmount, useTotalWithTax };
