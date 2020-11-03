OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "hasDealtDamage",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
BuffOnPreDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "hasDealtDamage",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Value1 = DAMAGESOURCE_PROC, CompareOp = CO_DAMAGE_SOURCETYPE_IS_NOT},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
            SubBlocks = {
              {
                Function = BBGetTeamID,
                Params = {TargetVar = "Owner", DestVar = "teamID"}
              },
              {
                Function = BBSetBuffCasterUnit,
                Params = {CasterVar = "Caster"}
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Attacker",
                  EffectName = "soraka_infuse_ally_tar.troy",
                  Flags = 0,
                  EffectIDVar = "a",
                  TargetObjectVar = "Attacker",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "teamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Caster",
                  EffectName = "soraka_infuse_ally_tar.troy",
                  Flags = 0,
                  EffectIDVar = "a",
                  TargetObjectVar = "Attacker",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "teamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageAmount",
                  Src1Value = 0,
                  Src2Value = 0.65,
                  DestVar = "manaRestore",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBIncPAR,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  PARType = PAR_MANA,
                  DeltaVar = "manaRestore"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "hasDealtDamage",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
                }
              }
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
      Name = "soraka_infuse_ally_tar.troy"
    }
  }
}
