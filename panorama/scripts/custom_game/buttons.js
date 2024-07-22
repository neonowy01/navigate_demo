function HoverSound()
{
     $.DispatchEvent("ClientUI_FireOutput", 0);
}

function Clicked()
{
     $.DispatchEvent("ClientUI_FireOutput", 1);
}

function Exit()
{
     $.DispatchEvent("ClientUI_FireOutput", 1);
     $.DispatchEvent("ClientUI_FireOutput", 2);
}

function Restart()
{
     $.DispatchEvent("ClientUI_FireOutput", 1);
     $.DispatchEvent("ClientUI_FireOutput", 3);
}
