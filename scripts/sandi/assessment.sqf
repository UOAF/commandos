_reason        = _this select 0;
_victoryPoints = _this select 1;
_blu_deaths    = _this select 2;
_red_deaths    = _this select 3;
_time          = _this select 4;
_flagsCaptured = _this select 5;

_reasonText = "";
switch (_reason) do {
  case "time": {
    _reasonText = " - Time Limit Reached";
  };
  case "CC": {
    _reasonText = " - A Force is Combat Ineffective";
  };
  default {
    _reasonText = "";
  };
};

_winner = "";

switch (true) do {
  case (_victoryPoints >= 50): {
    _winner = "BluFor Decisive Victory";
  };
  case (_victoryPoints < 50 && _victoryPoints >= 10): {
    _winner = "BluFor Marginal Victory";
  };
  case (_victoryPoints < 10 && _victoryPoints > -10): {
    _winner = "Draw";
  };
  case (_victoryPoints <= -10 && _victoryPoints > -50): {
    _winner = "RedFor Marginal Victory";
  };
  case (_victoryPoints <= -50): {
    _winner = "RedFor Decisive Victory";
  };
};

_text = "Mission End" + _reasonText + "\n\n" + _winner + "\n\n" + "Time Played: " + format ["%1", round (time / 60)] + " minutes" + "\n\n" + "Objectives Secured: " + format ["%1", (_flagsCaptured)] + "\n\n" + "BluFor Deaths: " + format ["%1", _blu_deaths] + "\n\n" + "RedFor Deaths: " + format ["%1", _red_deaths];
titleText [_text, "BLACK"];
//titleText ["Mission End - blah", "BLACK"];
//titleFadeOut 10;
sleep 20;
endMission "LOSER";