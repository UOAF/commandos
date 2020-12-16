//check blufor bodies

private["_GuyGettingSnuffed", "_objCount", "_randomNum", "_randomObj", "_text" ];

_GuyGettingSnuffed = _this select 3 select 0; 

_GuyGettingSnuffed removeAction takeIntelligence;  

systemChat "You pick up a coded message and a strange, 3'' square pad filled with random numbers. You should probably bring this to the base signaller."; 

player addItem "CUP_item_Cobalt_File";