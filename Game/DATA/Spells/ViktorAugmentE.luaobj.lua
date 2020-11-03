OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AP",
      Src1Value = 0,
      Src2Value = 0.1,
      DestVar = "abilityPower",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellIcon,
    Params = {
      SlotNumber = 2,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      IconIndex = 2
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Viktorb_red.troy",
      Flags = 0,
      EffectIDVar = "StaffIdleRED",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM_WEAPON_1",
      TargetObjectVar = "Owner",
      TargetBoneName = "BUFFBONE_CSTM_WEAPON_1",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_NEUTRAL,
      SpecificTeamOnlyOverrideVar = "OwnerTeam",
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "OwnerTeam",
      FOWVisibilityRadius = 200,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {}
BuffOnUpdateStatsBuildingBlocks = {}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AP",
      Src2Var = "abilityPower",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "AP",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ZhonyasRing"
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "AP",
          Src1Value = 0,
          Src2Value = 0.07,
          DestVar = "abilityPower",
          DestVarTable = "InstanceVars",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "AP",
          Src1Value = 0,
          Src2Value = 0.1,
          DestVar = "abilityPower",
          DestVarTable = "InstanceVars",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktorb_red.troy"
    }
  }
}
