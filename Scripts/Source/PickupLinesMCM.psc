Scriptname PickupLinesMCM extends SKI_ConfigBase Hidden 
{Mod Configuration Menu for Pickup Lines}

GlobalVariable property PickupLinesEnabled auto

Event OnConfigInit()
    ModName = "$ModName"
    Pages = new string[1]
    Pages[0] = "$Settings"
EndEvent

Event OnPageReset(string page)
    if page == ""
        LoadCustomContent("PickupLines/MCM.dds")
    else
        UnloadCustomContent()
    endIf

    if page == "$Settings"
        AddToggleOptionST("ToggleEnabled", "$Enabled", IsModEnabled())
    endIf
EndEvent

State ToggleEnabled
	Event OnSelectST()
        if IsModEnabled()
            DisableMod()
        else
            EnableMod()
        endIf
        SetToggleOptionValueST(IsModEnabled())
    EndEvent

	Event OnDefaultST()
        SetToggleOptionValueST(IsModEnabled())
    EndEvent

	Event OnHighlightST()
		SetInfoText("$EnablePickupLines")
    EndEvent
EndState

bool Function IsModEnabled()
    return PickupLinesEnabled.GetValueInt() > 0
EndFunction

Function DisableMod()
    PickupLinesEnabled.SetValueInt(0)
EndFunction

Function EnableMod()
    PickupLinesEnabled.SetValueInt(1)
EndFunction