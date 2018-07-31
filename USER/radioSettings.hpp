/*
*   Definiert voreingestellte Funkfrequenzen und Netznamen.
*   Netzname ist optional und wird, sofern vorhanden, bei Spielstart am Kartenrand vermerkt.
*
*   Die ersten 8 Shortrange Netze werden auf den SR Kanälen 1-8 und die ersten 9 Longrange Netze werden auf den LR Kanälen 1-9 voreingestellt.
*   Es können weitere Netze definiert werden, die dann in der groupsettings.hpp einzelnen Gruppen zugewiesen werden können.
*
*   Beispiel:
    class net1 {
        freq = 32.5;
        name = "Command Kanal";
    };

    //[...]

    class net10 {
        freq = 80.1;
        name = "Air Intern";
    };
*/

//SHORTRANGE KANÄLE ============================================================
class shortrange {
    class net1 {
        freq = 50;
        name = "Command";
    };

    class net2 {
        freq = 60;
        name = "Alpha";
    };

    class net3 {
        freq = 70;
        name = "Alpha1";
    };

    class net4 {
        freq = 80;
        name = "Alpha2";
    };

    class net5 {
        freq = 55;
        name = "Battlecat";
    };

    class net6 {
        freq = 100;
        name = "";
    };

    class net7 {
        freq = 110;
        name = "";
    };

    class net8 {
        freq = 120;
        name = "";
    };
};


//LONGRANGE KANÄLE =============================================================
class longrange {
    class net1 {
        freq = 50;
        name = "Command";
    };

    class net2 {
        freq = 55;
        name = "Battlecat"
    };

    class net3 {
        freq = 34;
        name = "";
    };

    class net4 {
        freq = 35;
        name = "";
    };

    class net5 {
        freq = 36;
        name = "";
    };

    class net6 {
        freq = 37;
        name = "";
    };

    class net7 {
        freq = 38;
        name = "";
    };

    class net8 {
        freq = 39;
        name = "";
    };

    class net9 {
        freq = 40;
        name = "";
    };
};
