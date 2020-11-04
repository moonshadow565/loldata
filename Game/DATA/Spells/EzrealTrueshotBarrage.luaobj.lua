NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
ChannelDuration = 1.1
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
AutoCooldownByLevel = {}
ChannelingStartBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      DestVarTable = "SpellVars",
      SrcVar = "TargetPos"
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      SrcVar = "TargetPos",
      SrcVarTable = "SpellVars"
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Nothing",
      PosVar = "TargetPos",
      EndPosVar = "TargetPos",
      SlotNumber = 2,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell8",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = false
    }
  }
}
