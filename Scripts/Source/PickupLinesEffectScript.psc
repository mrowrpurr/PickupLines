Scriptname PickupLinesEffectScript extends activemagiceffect  

Event OnEffectStart(Actor target, Actor caster)
    GotoState("WatchingItemsBeingPickedUp")
EndEvent

Event OnEffectFinish(Actor target, Actor caster)
    GotoState("")
EndEvent

State WatchingItemsBeingPickedUp
    Event OnItemAdded(Form item, int count, ObjectReference itemRef, ObjectReference container)
        Debug.Notification("You picked up " + count + "x " + item.GetName())
    EndEvent
EndState