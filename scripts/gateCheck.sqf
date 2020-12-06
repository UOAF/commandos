while {true} do { 

    while {stockadeLocked} do {   
        if ((stockadeGate animationPhase "door01") > 0) then { 
            stockadeGate animate ["door01",0];   

        };
        sleep 0.01;  
    }; 

    sleep 1; 

};
