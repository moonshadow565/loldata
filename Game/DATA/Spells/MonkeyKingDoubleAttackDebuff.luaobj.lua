BuffTextureName = "MonkeyKingCrushingBlow.dds"
BuffName = "MonkeyKingDoubleAttackDebuff"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorDebuff",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetArmor,
    Params = {
      TargetVar = "Owner",
      DestVar = "SubjectArmor"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ArmorDebuff",
      Src1VarTable = "InstanceVars",
      Src2Var = "SubjectArmor",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "armorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "armorInc",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "armorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "armorInc",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "monkey_king_crushingBlow_armor_debuff.troy",
      Flags = 0,
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "armorInc",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetArmor,
    Params = {
      TargetVar = "Owner",
      DestVar = "SubjectArmor"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SubjectArmor",
      Src2Var = "armorInc",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "SubjectArmor",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ArmorDebuff",
      Src1VarTable = "InstanceVars",
      Src2Var = "SubjectArmor",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "newarmorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "newarmorInc",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "newarmorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "monkey_king_crushingblow_armor_debuff.troy"
    }
  }
}
