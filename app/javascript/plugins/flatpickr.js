import flatpickr from "flatpickr";

const initflatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
    allowInput: true
  });
};

export {initflatpickr}
