BuffTextureName = "Armordillo_ScavengeArmor.dds"
BuffName = "Spiked Shell"
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetArmor,
    Params = {
      TargetVar = "Owner",
      DestVar = "ArmorAmount",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetSpellBlock,
    Params = {
      TargetVar = "Owner",
      DestVar = "MRAmount",
      DestVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "ArmorAmount",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.25,
      DestVar = "DamageAmount",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MRAmount",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.25,
      DestVar = "APAmount",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageAmount",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "APAmount",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetArmor,
    Params = {
      TargetVar = "Owner",
      DestVar = "ArmorAmount",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetSpellBlock,
    Params = {
      TargetVar = "Owner",
      DestVar = "MRAmount",
      DestVarTable = "InstanceVars"
    }
  }
}
