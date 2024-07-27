function DecodeCommand(command)
{
    if (command.includes("ReviverHP"))
    {
        var decoded = JSON.parse(command);

        var ReviverHealthLabel = $("#ReviverHealthPoints");
        ReviverHealthLabel.text = decoded["ReviverHP"];
    }
}

(function()
{
    $.RegisterForUnhandledEvent('AddStyle',function (param,ioud) {DecodeCommand(ioud);});
})();