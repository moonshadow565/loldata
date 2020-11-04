BuffTextureName = "Voidwalker_Netherburn.dds"
BuffName = "VoidStone"
PersistsThroughDeath = true
Nondispellable = true
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageType",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0.0015,
          DestVar = "AttackSpeedBoost",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "MagicAbsorb",
          Src2VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "AttackSpeedBoost",
          DestVarTable = "NextBuffVars",
          SrcVar = "AttackSpeedBoost"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "VoidStoneAttackSpeedBoost",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "voidstoneattackspeedboost"
    }
  }
}
