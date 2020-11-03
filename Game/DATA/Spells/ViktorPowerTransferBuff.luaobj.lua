BuffTextureName = "Averdrian_ConsumeSpirit.dds"
BuffName = "Haste"
AutoBuffActivateEffect = "HexMageTEMPQDEBUFF.troy"
AutoBuffActivateAttachBoneName = "spine"
OnBuffActivateBuildingBlocks = {}
OnBuffDeactivateBuildingBlocks = {}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Caster",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PercMaxHealthMod",
      SrcValueByLevel = {
        -0.03,
        -0.06,
        -0.09,
        -0.12,
        -0.15
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "PercMaxHealthMod",
      Delta = 0
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Other3"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Other3", PositionVar = "TargetPos"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Other3",
      TargetVar = "Other3",
      OverrideCastPosition = true,
      OverrideCastPosVar = "OwnerPos",
      SlotNumber = 2,
      SlotType = ExtraSlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  }
}
