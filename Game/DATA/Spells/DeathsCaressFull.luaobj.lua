NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sion_DeathsCaress.dds"
BuffName = "Death's Caress"
AutoBuffActivateEffect = "DeathsCaress_buf.troy"
AutoBuffActivateEvent = "DeathsCaress_buf.prt"
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Target",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorAmount",
      SrcValueByLevel = {
        120,
        170,
        220,
        270,
        320
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 1.2,
      DestVar = "BonusHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusHealth",
      Src2Var = "ArmorAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalArmorAmount",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TotalArmorAmount",
      DestVarTable = "NextBuffVars",
      SrcVar = "TotalArmorAmount"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "FinalArmorAmount",
      DestVarTable = "NextBuffVars",
      SrcVar = "TotalArmorAmount"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Ticktimer",
      DestVarTable = "NextBuffVars",
      SrcValue = 10
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "DeathsCaress",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 10,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deathscaress"
    }
  }
}
