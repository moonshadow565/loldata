BuffTextureName = "Armsmaster_RelentlessMR.dds"
BuffName = "RelentlessBarrier"
AutoBuffActivateEffect = "JaxRelentlessAssault_buf.troy"
AutoBuffActivateAttachBoneName = ""
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "BonusMR",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Value1 = DAMAGESOURCE_PERIODIC, CompareOp = CO_DAMAGE_SOURCETYPE_IS_NOT},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "DamageType",
          Value2 = MAGIC_DAMAGE,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "JaxRelentlessAssaultShield_hit.troy",
              Flags = 0,
              EffectIDVar = "OnHitSpellEffect",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jaxrelentlessassaultshield_hit.troy"
    }
  }
}
