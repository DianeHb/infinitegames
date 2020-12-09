const initLendGame = () => {
  const borrower = document.getElementById("library_game_borrower_id");
  const borrower_type = document.getElementById("library_game_borrower_type");
  if (borrower) {
    borrower.addEventListener('change', (event) => {
      const group = borrower.options[borrower.selectedIndex].parentNode.label;
      borrower_type.value = group === "Guests" ? "Guest" : "User"
    });
  }
};

export {initLendGame}
