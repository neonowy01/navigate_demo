function DecodeCommand(command)
{
    if (command.includes("Time") || command.includes("SoldierDeaths"))
    {
        var decoded = JSON.parse(command);

        //Time
        var TimeLabel = $("#Time");
        TimeLabel.text = "Time: " + decoded["Time"];

        var DeathsLabel = $("#Deaths");
        DeathsLabel.text = "Soldier Deaths: " + decoded["SoldierDeaths"];
    }
}

(function()
{
    $.RegisterForUnhandledEvent('AddStyle',function (param,ioud) {DecodeCommand(ioud);});
})();