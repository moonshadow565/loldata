BuffTextureName = "034_Steel_Shield.dds"
BuffName = "Aegis of the Legion"
AutoBuffActivateEffect = "Aegis_buf.troy"
AutoBuffActivateEffect2 = "BloodBoil_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
AutoBuffActivateEffect3 = "Bloodboil_buf.troy"
AutoBuffActivateAttachBoneName3 = "l_hand"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MagicResistBonus",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorBonus",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageBonus",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "MagicResistBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
