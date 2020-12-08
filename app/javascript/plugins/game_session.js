const initGameSession = () => {
  //document.getElementById('abyme--tasks').addEventListener('abyme:after-add', yourCallback)
  document.getElementById('abyme--game_session_players').addEventListener('abyme:after-add', (event) => {
    let all_players = document.querySelectorAll('.selected_player');
    all_players.forEach((element) => {
      // let player = element["children"][0]["children"][1]
      let player = element.querySelector(".player_select")
      let playerType = element.querySelector(".player_type")
      if (player) {
        player.addEventListener('change', (event) => {
          let group = player.options[player.selectedIndex].parentNode.label;
          playerType.value = group === "Guests" ? "Guest" : "User";
          console.log(playerType.value)
        });
      }
    });
  });
};

export {initGameSession}
