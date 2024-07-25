function DecodeCommand(command)
{
    if (command.includes("JoshHP"))
    {
        var decoded = JSON.parse(command);

        var HealthLabel = $("#HealthPoints");
        HealthLabel.text = decoded["JoshHP"];
    }
}

(function()
{
    $.RegisterForUnhandledEvent('AddStyle',function (param,ioud) {DecodeCommand(ioud);});
})();