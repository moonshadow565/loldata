DoLuaLevel("GlobalLevelScript")
EVENT_STAGE_WELCOME_TIME = 15
EVENT_STAGE_PREANNOUNCE_TIME = 30
EVENT_STAGE_MINIONS_SPAWNED_TIME = 120
MAX_MINIONS_EVER = 180
TEAM_ORDER = 100
TEAM_CHAOS = 200
ORDER_HQ = 1
CHAOS_HQ = 2
FRONT_TOWER = 4
MID_TOWER = 3
BACK_TOWER = 2
BACK_TOWER2 = 1
CENTER_LANE = 1
INITIAL_TIME_TO_SPAWN = 60
CANNON_MINION_SPAWN_FREQUENCY = 3
MINION_HEALTH_DENIAL_PERCENT = 0
UPGRADE_MINION_TIMER = 90
UPGRADE_MINION_ITERATIONS_FOR_LATE_SCALING = 6
TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION = 3
EXP_GIVEN_RADIUS = 1400
GOLD_GIVEN_RADIUS = 1250
DISABLE_MINION_SPAWN_BASE_TIME = 300
DISABLE_MINION_SPAWN_MAG_TIME = 0
CHAOS_INHIBITOR_RESPAWN_ANIMATION_DURATION = 11.67
ORDER_INHIBITOR_RESPAWN_ANIMATION_DURATION = 11
LAST_WAVE = -1
HQTurretAttackable = false
UpgradedMinionIterations = 0
SpawnTable = {
  WaveSpawnRate = 30000,
  SingleMinionSpawnDelay = 800,
  ExpRadius = EXP_GIVEN_RADIUS,
  GoldRadius = GOLD_GIVEN_RADIUS
}
MeleeDefaultMinionInfo = {
  DefaultNumPerWave = 3,
  Armor = 0,
  ArmorUpgrade = 1,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0.625,
  HPBonus = 0,
  HPUpgrade = 13,
  HPUpgradeGrowth = 0.2,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 2,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 0.5,
  DamageInhibitor = 0,
  ExpGiven = 64,
  ExpBonus = 0,
  ExpUpgrade = 5,
  ExpInhibitor = 0,
  GoldGiven = 26,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 10,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
CasterDefaultMinionInfo = {
  DefaultNumPerWave = 3,
  Armor = 0,
  ArmorUpgrade = 0.625,
  MagicResistance = 0,
  MagicResistanceUpgrade = 1,
  HPBonus = 0,
  HPUpgrade = 10,
  HPUpgradeGrowth = 0.2,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 1,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1,
  DamageInhibitor = 0,
  ExpGiven = 32,
  ExpBonus = 0,
  ExpUpgrade = 3,
  ExpInhibitor = 0,
  GoldGiven = 19,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 10,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
CannonDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 1.5,
  MagicResistance = 0,
  MagicResistanceUpgrade = 1.5,
  HPBonus = 0,
  HPUpgrade = 23,
  HPUpgradeGrowth = 0.3,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 3,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1.5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 7,
  ExpInhibitor = 0,
  GoldGiven = 42,
  GoldBonus = 0,
  GoldUpgrade = 1,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
SuperDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 0,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0,
  HPBonus = 0,
  HPUpgrade = 100,
  HPUpgradeGrowth = 0,
  HPUpgradeLate = 0,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 42,
  GoldBonus = 0,
  GoldUpgrade = 1,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
OrderMeleeMinionInfo = {
  MinionName = "HA_OrderMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
ChaosMeleeMinionInfo = {
  MinionName = "HA_ChaosMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
OrderCasterMinionInfo = {
  MinionName = "HA_OrderMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
ChaosCasterMinionInfo = {
  MinionName = "HA_ChaosMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
OrderCannonMinionInfo = {
  MinionName = "HA_OrderMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
ChaosCannonMinionInfo = {
  MinionName = "HA_ChaosMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
OrderSuperMinionInfo = {
  MinionName = "HA_OrderMinionSuper",
  DefaultInfo = SuperDefaultMinionInfo
}
ChaosSuperMinionInfo = {
  MinionName = "HA_ChaosMinionSuper",
  DefaultInfo = SuperDefaultMinionInfo
}
DefaultBarrackInfo = {
  IsDestroyed = false,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  SpawnOrderMinionNames = {
    "Super",
    "Melee",
    "Cannon",
    "Caster"
  }
}
DefaultOrderMinionInfoTable = {
  Melee = OrderMeleeMinionInfo,
  Caster = OrderCasterMinionInfo,
  Cannon = OrderCannonMinionInfo,
  Super = OrderSuperMinionInfo
}
DefaultChaosMinionInfoTable = {
  Melee = ChaosMeleeMinionInfo,
  Caster = ChaosCasterMinionInfo,
  Cannon = ChaosCannonMinionInfo,
  Super = ChaosSuperMinionInfo
}
OrderBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
OrderBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
OrderBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
ChaosBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
ChaosBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
ChaosBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
function AppendTable(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  if A1_1 ~= nil then
    L4_4 = type
    L5_5 = A1_1
    L4_4 = L4_4(L5_5)
    if L4_4 == "table" then
      L4_4, L5_5 = nil, nil
      if A0_0 == nil then
        A0_0 = L6_6
      end
      for L9_9, L10_10 in L6_6(L7_7) do
        if A2_2 == true and type(L10_10) == "table" then
          A0_0[L9_9] = AppendTable(A0_0[L9_9], L10_10, A3_3, A3_3)
        else
          A0_0[L9_9] = L10_10
        end
      end
    end
  end
  return A0_0
end
function InitBarrackInfo(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20
  L1_12 = AppendTable
  L2_13 = A0_11
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16)
  A0_11 = L1_12
  L1_12 = AppendTable
  L2_13 = A0_11.MinionInfoTable
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16)
  A0_11.MinionInfoTable = L1_12
  L1_12 = A0_11.MinionInfoTable
  if L1_12 ~= nil then
    L1_12 = A0_11.MinionInfoTable
    L2_13 = nil
    for L7_18, L8_19 in L4_15(L5_16) do
      L9_20 = L1_12[L7_18]
      if L9_20.DefaultInfo ~= nil then
        AppendTable(L9_20, L9_20.DefaultInfo, true, true)
        L9_20.NumPerWave = L9_20.DefaultNumPerWave
        L9_20.GoldGivenBase = L9_20.GoldGiven
        L9_20.ExpGivenBase = L9_20.ExpGiven
      end
    end
  end
  L1_12 = A0_11.Overrides
  if L1_12 ~= nil then
    L1_12, L2_13 = nil, nil
    for L6_17, L7_18 in L3_14(L4_15) do
      L8_19 = type
      L9_20 = A0_11[L6_17]
      L8_19 = L8_19(L9_20)
      if L8_19 == "table" then
        L8_19 = type
        L9_20 = L7_18
        L8_19 = L8_19(L9_20)
        if L8_19 == "table" then
          L8_19 = AppendTable
          L9_20 = A0_11[L6_17]
          L8_19(L9_20, L7_18, true, true)
        end
      else
        L8_19 = type
        L9_20 = L7_18
        L8_19 = L8_19(L9_20)
        if L8_19 ~= "table" then
          A0_11[L6_17] = L7_18
        end
      end
    end
  end
  return A0_11
end
OrderBarracksBonuses = {
  InitBarrackInfo(OrderBarrack0),
  InitBarrackInfo(OrderBarrack1),
  InitBarrackInfo(OrderBarrack2)
}
ChaosBarracksBonuses = {
  InitBarrackInfo(ChaosBarrack0),
  InitBarrackInfo(ChaosBarrack1),
  InitBarrackInfo(ChaosBarrack2)
}
OrderBuildingStatus = {
  Turret4 = true,
  Turret3 = true,
  Turret2 = true,
  Turret1 = true,
  Barracks = true,
  HQ = true
}
ChaosBuildingStatus = {
  Turret4 = true,
  Turret3 = true,
  Turret2 = true,
  Turret1 = true,
  Barracks = true,
  HQ = true
}
TotalNumberOfMinions = 0
function PreloadBarrackCharacters(A0_21)
  local L1_22, L2_23
  for _FORV_6_, _FORV_7_ in pairs(A0_21.DefaultMinionInfoTable) do
    if _FORV_7_.PreloadedCharacter == nil then
      _FORV_7_.PreloadedCharacter = 1
      PreloadCharacter(_FORV_7_.MinionName)
    end
  end
end
function OnLevelInit()
  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37
  L3_27(L4_28)
  L3_27(L4_28)
  L3_27(L4_28)
  for L6_30, L7_31 in L3_27(L4_28) do
    L8_32 = PreloadBarrackCharacters
    L8_32(L9_33)
  end
  for L6_30, L7_31 in L3_27(L4_28) do
    L8_32 = PreloadBarrackCharacters
    L8_32(L9_33)
  end
  L3_27.WaveSpawnRate = 30000
  L3_27.SingleMinionSpawnDelay = 800
  if L3_27 == "FIRSTBLOOD" then
    L4_28.ExpGiven = 64
    L4_28.GoldGiven = 19.75
    L4_28.GoldUpgrade = 0.25
    L4_28.HPUpgrade = 10
    L4_28.DamageUpgrade = 0.5
    L4_28.ExpUpgrade = 2
    L4_28.ArmorUpgrade = 1
    L4_28.MagicResistanceUpgrade = 0.625
    L4_28.GoldMaximumBonus = 12
    L5_29.ExpGiven = 32
    L5_29.GoldGiven = 14.75
    L5_29.GoldUpgrade = 0.25
    L5_29.HPUpgrade = 7.5
    L5_29.DamageUpgrade = 1
    L5_29.ExpUpgrade = 1.2
    L5_29.ArmorUpgrade = 0.625
    L5_29.MagicResistanceUpgrade = 1
    L5_29.GoldMaximumBonus = 8
    L6_30 = {}
    L6_30.ExpGiven = 100
    L6_30.GoldGiven = 39.5
    L6_30.GoldUpgrade = 0.5
    L6_30.HPUpgrade = 10
    L6_30.DamageUpgrade = 1.5
    L6_30.ExpUpgrade = 3
    L6_30.ArmorUpgrade = 1.5
    L6_30.MagicResistanceUpgrade = 1.5
    L6_30.GoldMaximumBonus = 30
    L7_31 = {}
    L7_31.ExpGiven = 100
    L7_31.GoldGiven = 27
    L7_31.GoldUpgrade = 0
    L7_31.HPUpgrade = 100
    L7_31.DamageUpgrade = 5
    L7_31.ExpUpgrade = 0
    L7_31.ArmorUpgrade = 0
    L7_31.MagicResistanceUpgrade = 0
    L7_31.GoldMaximumBonus = 30
    L8_32 = {}
    L8_32.Melee = L4_28
    L8_32.Caster = L5_29
    L8_32.Cannon = L6_30
    L8_32.Super = L7_31
    for L12_36, L13_37 in L9_33(L10_34) do
      for _FORV_21_, _FORV_22_ in pairs(L13_37) do
        OrderBarracksBonuses[1].MinionInfoTable[L12_36][_FORV_21_] = _FORV_22_
        ChaosBarracksBonuses[1].MinionInfoTable[L12_36][_FORV_21_] = _FORV_22_
      end
    end
    INITIAL_TIME_TO_SPAWN = L9_33
    UPGRADE_MINION_TIMER = L9_33
  end
  if L3_27 == "TUTORIAL" then
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    INITIAL_TIME_TO_SPAWN = L4_28
    L4_28.NumOfMeleeMinionsPerWave = 0
    L4_28.NumOfCasterMinionsPerWave = 0
  else
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    if L3_27 == "FIRSTBLOOD" then
      L4_28(L5_29)
      L4_28(L5_29)
      L4_28(L5_29)
      L4_28(L5_29)
      L4_28(L5_29)
    end
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28.NumOfMeleeMinionsPerWave = 3
    L4_28.NumOfCasterMinionsPerWave = 3
    L4_28(L5_29)
    L4_28()
  end
  L4_28(L5_29)
  L13_37 = L5_29()
  L4_28(L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37, L5_29())
end
function OnLevelInitServer()
  local L0_38, L1_39
  L0_38 = GetGameMode
  L0_38 = L0_38()
  if L0_38 == "TUTORIAL" then
    L1_39 = InitTimer
    L1_39("PlaceTutorialSpawnRunes", 1, false)
  else
    L1_39 = InitTimer
    L1_39("UpgradeMinionTimer", UPGRADE_MINION_TIMER, true)
    L1_39 = InitTimer
    L1_39("AllowDamageOnBuildings", 10, false)
  end
  L1_39 = GetMutatorParameterString
  L1_39 = L1_39("BountyMode")
  LoadLevelScriptIntoScript(L1_39)
end
function OnPostLevelLoad()
  local L0_40, L1_41, L2_42, L3_43, L4_44, L5_45
  L0_40 = LoadLevelScriptIntoScript
  L0_40(L1_41)
  L0_40 = GetGameMode
  L0_40 = L0_40()
  if L0_40 == "TUTORIAL" then
    L1_41()
  else
    L1_41()
    for L4_44 = RIGHT_LANE, LEFT_LANE do
      L5_45 = GetDampener
      L5_45 = L5_45(TEAM_ORDER, L4_44)
      SetDampenerRespawnAnimationDuration(L5_45, ORDER_INHIBITOR_RESPAWN_ANIMATION_DURATION)
      L5_45 = GetDampener(TEAM_CHAOS, L4_44)
      SetDampenerRespawnAnimationDuration(L5_45, CHAOS_INHIBITOR_RESPAWN_ANIMATION_DURATION)
      SetLaneExposed(TEAM_ORDER, L4_44, false)
      SetLaneExposed(TEAM_CHAOS, L4_44, false)
      SetLaneTowerCount(TEAM_ORDER, L4_44, 3)
      SetLaneTowerCount(TEAM_CHAOS, L4_44, 3)
    end
    L1_41(L2_42)
    L1_41(L2_42)
    L1_41(L2_42, L3_43)
    L1_41(L2_42, L3_43)
    L1_41(L2_42, L3_43)
  end
end
function OppositeTeam(A0_46)
  if A0_46 == TEAM_CHAOS then
    return TEAM_ORDER
  else
    return TEAM_CHAOS
  end
end
function AllowDamageOnBuildings()
  local L0_47, L1_48, L2_49, L3_50, L4_51, L5_52, L6_53
  L0_47 = CENTER_LANE
  for L4_51 = BACK_TOWER2, FRONT_TOWER do
    L5_52 = GetTurret
    L6_53 = TEAM_ORDER
    L5_52 = L5_52(L6_53, L0_47, L4_51)
    if L5_52 ~= nil then
      L6_53 = FRONT_TOWER
      if L4_51 == L6_53 then
        L6_53 = SetInvulnerable
        L6_53(L5_52, false)
        L6_53 = SetTargetable
        L6_53(L5_52, true)
      else
        L6_53 = SetInvulnerable
        L6_53(L5_52, true)
        L6_53 = SetNotTargetableToTeam
        L6_53(L5_52, true, TEAM_CHAOS)
      end
    else
    end
    L6_53 = GetTurret
    L6_53 = L6_53(TEAM_CHAOS, L0_47, L4_51)
    if L6_53 ~= nil then
      if L4_51 == FRONT_TOWER then
        SetInvulnerable(L6_53, false)
        SetTargetable(L6_53, true)
      else
        SetInvulnerable(L6_53, true)
        SetNotTargetableToTeam(L6_53, true, TEAM_ORDER)
      end
    else
    end
  end
end
function ResetToDefaultWaveCounts(A0_54)
  local L1_55, L2_56
  for _FORV_6_, _FORV_7_ in pairs(A0_54) do
    _FORV_7_.NumPerWave = _FORV_7_.DefaultNumPerWave
  end
end
function ClearCurrentWaveCounts(A0_57)
  local L1_58, L2_59
  for _FORV_6_, _FORV_7_ in pairs(A0_57) do
    _FORV_7_.NumPerWave = 0
  end
end
function GetInitSpawnInfo(A0_60, A1_61)
  local L2_62, L3_63, L4_64
  L2_62 = 0
  L3_63 = TEAM_ORDER
  if A1_61 == L3_63 then
    L3_63 = OrderBarracksBonuses
    L4_64 = A0_60 + 1
    L2_62 = L3_63[L4_64]
  else
    L3_63 = ChaosBarracksBonuses
    L4_64 = A0_60 + 1
    L2_62 = L3_63[L4_64]
  end
  L3_63 = {}
  L4_64 = SpawnTable
  L4_64 = L4_64.WaveSpawnRate
  L3_63.WaveSpawnRate = L4_64
  L4_64 = SpawnTable
  L4_64 = L4_64.SingleMinionSpawnDelay
  L3_63.SingleMinionSpawnDelay = L4_64
  L4_64 = L2_62.IsDestroyed
  L3_63.IsDestroyed = L4_64
  L4_64 = L2_62.MinionInfoTable
  L3_63.MinionInfoTable = L4_64
  ReturnTable = L3_63
  L3_63 = ReturnTable
  return L3_63
end
function GetMinionSpawnInfo(A0_65, A1_66, A2_67, A3_68, A4_69)
  local L5_70, L6_71, L7_72
  L5_70 = 0
  L6_71 = TEAM_ORDER
  if A3_68 == L6_71 then
    L6_71 = OrderBarracksBonuses
    L5_70 = L6_71[1]
  else
    L6_71 = ChaosBarracksBonuses
    L5_70 = L6_71[1]
  end
  L6_71 = L5_70.MinionInfoTable
  L6_71 = L6_71.Super
  L7_72 = L5_70.MinionInfoTable
  L7_72 = L7_72.Cannon
  ResetToDefaultWaveCounts(L5_70.MinionInfoTable)
  if A1_66 % CANNON_MINION_SPAWN_FREQUENCY == 0 then
    L7_72.NumPerWave = L7_72.NumPerWave + 1
  end
  if A4_69 ~= LAST_WAVE then
    BARRACKSCOUNT = 6
    totalMinionsRemaining = MAX_MINIONS_EVER - GetTotalTeamMinionsSpawned()
    LAST_WAVE = A4_69
  end
  if L5_70.WillSpawnSuperMinion == 1 then
    L6_71.NumPerWave = 1
    L7_72.NumPerWave = 0
  end
  ReturnTable = {
    NewFormat = true,
    SpawnOrderMinionNames = L5_70.SpawnOrderMinionNames,
    IsDestroyed = L5_70.IsDestroyed,
    ExperienceRadius = SpawnTable.ExpRadius,
    GoldRadius = SpawnTable.GoldRadius,
    MinionInfoTable = L5_70.MinionInfoTable
  }
  return ReturnTable
end
function UpgradeMinionTimer()
  local L0_73, L1_74, L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82, L10_83, L11_84
  UpgradedMinionIterations = L1_74
  L1_74(L2_75, L3_76)
  for L4_77 = 1, 2 do
    if L4_77 == 1 then
      L0_73 = OrderBarracksBonuses
    else
      L0_73 = ChaosBarracksBonuses
    end
    for L8_81 = 1, 3 do
      L9_82, L10_83 = nil, nil
      L11_84 = L0_73[L8_81]
      L11_84 = L11_84.MinionInfoTable
      for _FORV_15_, _FORV_16_ in pairs(L11_84) do
        if UpgradedMinionIterations >= UPGRADE_MINION_ITERATIONS_FOR_LATE_SCALING then
        end
        _FORV_16_.HPBonus = _FORV_16_.HPBonus + (_FORV_16_.HPUpgrade + _FORV_16_.HPUpgradeLate)
        _FORV_16_.HPUpgrade = _FORV_16_.HPUpgrade + (_FORV_16_.HPUpgradeGrowth + _FORV_16_.HPUpgradeGrowthLate)
        _FORV_16_.DamageBonus = _FORV_16_.DamageBonus + _FORV_16_.DamageUpgrade
        _FORV_16_.GoldBonus = _FORV_16_.GoldBonus + _FORV_16_.GoldUpgrade
        if _FORV_16_.GoldBonus > _FORV_16_.GoldMaximumBonus then
          _FORV_16_.GoldBonus = _FORV_16_.GoldMaximumBonus
        end
        _FORV_16_.LocalGoldBonus = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShareUpgrade
        _FORV_16_.Armor = _FORV_16_.Armor
        _FORV_16_.MagicResistance = _FORV_16_.MagicResistance
        _FORV_16_.ExpBonus = _FORV_16_.ExpBonus + _FORV_16_.ExpUpgrade
        _FORV_16_.GoldGiven = _FORV_16_.GoldBonus + _FORV_16_.GoldGivenBase
        _FORV_16_.LocalGoldGiven = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShared
        _FORV_16_.ExpGiven = _FORV_16_.ExpBonus + _FORV_16_.ExpGivenBase
      end
    end
  end
end
function DeactivateCorrectStructure(A0_85, A1_86, A2_87)
  local L3_88, L4_89
  L4_89 = GetGameMode
  L4_89 = L4_89()
  if L4_89 ~= "TUTORIAL" then
    L4_89 = TEAM_ORDER
    if A0_85 == L4_89 then
      L3_88 = OrderBuildingStatus
    else
      L3_88 = ChaosBuildingStatus
    end
    L4_89 = FRONT_TOWER
    if A2_87 == L4_89 then
      L3_88.Turret4 = false
      L4_89 = GetTurret
      L4_89 = L4_89(A0_85, A1_86, MID_TOWER)
      SetInvulnerable(L4_89, false)
      SetTargetable(L4_89, true)
    else
      L4_89 = MID_TOWER
      if A2_87 == L4_89 then
        L3_88.Turret3 = false
        L4_89 = GetDampener
        L4_89 = L4_89(A0_85, A1_86)
        SetInvulnerable(L4_89, false)
        SetTargetable(L4_89, true)
      else
        L4_89 = BACK_TOWER
        if A2_87 ~= L4_89 then
          L4_89 = BACK_TOWER2
        elseif A2_87 == L4_89 then
          L4_89 = BACK_TOWER
          if A2_87 == L4_89 then
            L3_88.Turret2 = false
          else
            L3_88.Turret1 = false
          end
          L4_89 = L3_88.Turret1
          if L4_89 == false then
            L4_89 = L3_88.Turret2
            if L4_89 == false then
              L4_89 = GetHQ
              L4_89 = L4_89(A0_85)
              SetInvulnerable(L4_89, false)
              SetTargetable(L4_89, true)
            end
          end
        end
      end
    end
  end
end
function GetLuaBarracks(A0_90, A1_91)
  local L2_92, L3_93, L4_94
  L3_93 = TEAM_ORDER
  if A0_90 == L3_93 then
    L3_93 = OrderBarracksBonuses
    L4_94 = A1_91 + 1
    L2_92 = L3_93[L4_94]
  else
    L3_93 = ChaosBarracksBonuses
    L4_94 = A1_91 + 1
    L2_92 = L3_93[L4_94]
  end
  return L2_92
end
function GetDisableMinionSpawnTime(A0_95, A1_96)
  barrack = GetLuaBarracks(A1_96, A0_95)
  return DISABLE_MINION_SPAWN_BASE_TIME + DISABLE_MINION_SPAWN_MAG_TIME * barrack.NumOfSpawnDisables
end
function DisableBarracksSpawn(A0_97, A1_98)
  cLangBarracks = GetBarracks(A1_98, A0_97)
  luaBarrack = GetLuaBarracks(A1_98, A0_97)
  SetDisableMinionSpawn(cLangBarracks, GetDisableMinionSpawnTime(A0_97, A1_98))
  luaBarrack.NumOfSpawnDisables = luaBarrack.NumOfSpawnDisables + 1
end
BonusesCounter = 0
function ApplyBarracksDestructionBonuses(A0_99, A1_100)
  local L2_101, L3_102, L4_103, L5_104, L6_105
  L2_101 = BonusesCounter
  L2_101 = L2_101 + 1
  BonusesCounter = L2_101
  L2_101 = 1
  L3_102 = nil
  L4_103 = TEAM_ORDER
  if A0_99 == L4_103 then
    L3_102 = OrderBarracksBonuses
  else
    L3_102 = ChaosBarracksBonuses
  end
  L4_103, L5_104 = nil, nil
  L6_105 = L3_102[L2_101]
  L6_105 = L6_105.MinionInfoTable
  for _FORV_10_, _FORV_11_ in pairs(L6_105) do
    _FORV_11_.HPBonus = _FORV_11_.HPBonus + _FORV_11_.HPInhibitor
    _FORV_11_.DamageBonus = _FORV_11_.DamageBonus + _FORV_11_.DamageInhibitor
    _FORV_11_.ExpGiven = _FORV_11_.ExpGiven - _FORV_11_.ExpInhibitor
    _FORV_11_.GoldGiven = _FORV_11_.GoldGiven - _FORV_11_.GoldInhibitor
  end
  L3_102[L2_101].WillSpawnSuperMinion = 1
end
function ApplyBarracksRespawnReductions(A0_106, A1_107)
  local L2_108, L3_109, L4_110, L5_111, L6_112, L7_113, L8_114, L9_115
  L2_108 = Log
  L3_109 = "Inhibitor respawn, barrack ID is: "
  L4_110 = A1_107
  L3_109 = L3_109 .. L4_110
  L2_108(L3_109)
  L2_108 = CENTER_LANE
  L3_109 = nil
  L4_110 = TEAM_ORDER
  if A0_106 == L4_110 then
    L3_109 = OrderBarracksBonuses
  else
    L3_109 = ChaosBarracksBonuses
  end
  L4_110, L5_111 = nil, nil
  L6_112 = L3_109[L2_108]
  L6_112 = L6_112.MinionInfoTable
  for _FORV_10_, _FORV_11_ in L7_113(L8_114) do
    _FORV_11_.HPBonus = _FORV_11_.HPBonus - _FORV_11_.HPInhibitor
    _FORV_11_.DamageBonus = _FORV_11_.DamageBonus - _FORV_11_.DamageInhibitor
    _FORV_11_.ExpGiven = _FORV_11_.ExpGiven + _FORV_11_.ExpInhibitor
    _FORV_11_.GoldGiven = _FORV_11_.GoldGiven + _FORV_11_.GoldInhibitor
  end
  L7_113.WillSpawnSuperMinion = 0
  if A0_106 == L7_113 then
    L8_114(L9_115, true)
    L8_114(L9_115, false)
    if L8_114 ~= Nil then
      SetInvulnerable(L8_114, true)
      SetNotTargetableToTeam(L8_114, true, A0_106)
    end
    if L9_115 ~= Nil then
      SetInvulnerable(L9_115, true)
      SetNotTargetableToTeam(L9_115, true, A0_106)
    end
  elseif A0_106 == L7_113 then
    L8_114(L9_115, true)
    L8_114(L9_115, false)
    if L8_114 ~= Nil then
      SetInvulnerable(L8_114, true)
      SetNotTargetableToTeam(L8_114, true, A0_106)
    end
    if L9_115 ~= Nil then
      SetInvulnerable(L9_115, true)
      SetNotTargetableToTeam(L9_115, true, A0_106)
    end
  end
end
function BarrackReactiveEvent(A0_116, A1_117)
  local L2_118
  L2_118 = OppositeTeam(A0_116)
  dampener = GetDampener(A0_116, A1_117)
  SetInvulnerable(dampener, false)
  SetTargetable(dampener, true)
  ApplyBarracksRespawnReductions(L2_118, A1_117)
end
function HandleDestroyedObject(A0_119)
  local L1_120, L2_121, L3_122
  L1_120 = GetHQType
  L2_121 = A0_119
  L1_120 = L1_120(L2_121)
  HQType = L1_120
  L1_120 = HQType
  L2_121 = ORDER_HQ
  if L1_120 ~= L2_121 then
    L1_120 = HQType
    L2_121 = CHAOS_HQ
  elseif L1_120 == L2_121 then
    L1_120 = HQType
    L2_121 = CHAOS_HQ
    if L1_120 == L2_121 then
      L1_120 = EndOfGameCeremony
      L2_121 = TEAM_ORDER
      L3_122 = A0_119
      L1_120(L2_121, L3_122)
    else
      L1_120 = EndOfGameCeremony
      L2_121 = TEAM_CHAOS
      L3_122 = A0_119
      L1_120(L2_121, L3_122)
    end
    return
  end
  L1_120 = IsDampener
  L2_121 = A0_119
  L1_120 = L1_120(L2_121)
  if L1_120 then
    L1_120 = GetLinkedBarrack
    L2_121 = A0_119
    L1_120 = L1_120(L2_121)
    barrack = L1_120
    L1_120 = GetTeamID
    L2_121 = barrack
    L1_120 = L1_120(L2_121)
    barrackTeam = L1_120
    L1_120 = GetLane
    L2_121 = A0_119
    L1_120 = L1_120(L2_121)
    barrackLane = L1_120
    L1_120 = DisableBarracksSpawn
    L2_121 = barrackLane
    L3_122 = barrackTeam
    L1_120(L2_121, L3_122)
    L1_120 = SetDampenerState
    L2_121 = A0_119
    L3_122 = DampenerRegenerationState
    L1_120(L2_121, L3_122)
    L1_120 = SetInvulnerable
    L2_121 = A0_119
    L3_122 = true
    L1_120(L2_121, L3_122)
    L1_120 = SetTargetable
    L2_121 = A0_119
    L3_122 = false
    L1_120(L2_121, L3_122)
    L1_120 = GetGameMode
    L1_120 = L1_120()
    if L1_120 == "TUTORIAL" then
      L1_120 = GetHQ
      L2_121 = Team
      L1_120 = L1_120(L2_121)
      L2_121 = SetInvulnerable
      L3_122 = L1_120
      L2_121(L3_122, false)
      L2_121 = SetTargetable
      L3_122 = L1_120
      L2_121(L3_122, true)
    else
      L1_120 = GetTurret
      L2_121 = barrackTeam
      L3_122 = barrackLane
      L1_120 = L1_120(L2_121, L3_122, BACK_TOWER)
      L2_121 = GetTurret
      L3_122 = barrackTeam
      L2_121 = L2_121(L3_122, barrackLane, BACK_TOWER2)
      L3_122 = Nil
      if L1_120 ~= L3_122 then
        L3_122 = SetInvulnerable
        L3_122(L1_120, false)
        L3_122 = SetTargetable
        L3_122(L1_120, true)
      end
      L3_122 = Nil
      if L2_121 ~= L3_122 then
        L3_122 = SetInvulnerable
        L3_122(L2_121, false)
        L3_122 = SetTargetable
        L3_122(L2_121, true)
      end
      L3_122 = Nil
      if L1_120 == L3_122 then
        L3_122 = Nil
        if L2_121 == L3_122 then
          L3_122 = GetHQ
          L3_122 = L3_122(barrackTeam)
          SetInvulnerable(L3_122, false)
          SetTargetable(L3_122, true)
        end
      end
    end
    L1_120 = nil
    L2_121 = barrackTeam
    L3_122 = TEAM_CHAOS
    if L2_121 == L3_122 then
      L1_120 = TEAM_ORDER
    else
      L1_120 = TEAM_CHAOS
    end
    L2_121 = ApplyBarracksDestructionBonuses
    L3_122 = L1_120
    L2_121(L3_122, barrackLane)
  end
  L1_120 = IsTurretAI
  L2_121 = A0_119
  L1_120 = L1_120(L2_121)
  if L1_120 then
    L1_120 = GetTeamID
    L2_121 = A0_119
    L1_120 = L1_120(L2_121)
    L2_121 = GetObjectLaneId
    L3_122 = A0_119
    L2_121 = L2_121(L3_122)
    L3_122 = GetTurretPosition
    L3_122 = L3_122(A0_119)
    DeactivateCorrectStructure(L1_120, L2_121, L3_122)
    return
  end
  L1_120 = GetDampenerType
  L2_121 = A0_119
  L1_120 = L1_120(L2_121)
  if L1_120 > -1 then
    L2_121 = 0
    L3_122 = TEAM_ORDER
    if L1_120 % TEAM_CHAOS == CENTER_LANE then
      L2_121 = ChaosBarracksBonuses[L1_120 % TEAM_CHAOS + 1]
      ChaosBuildingStatus.Barracks = false
    else
      L3_122 = TEAM_CHAOS
      L2_121 = OrderBarracksBonuses[L1_120 % TEAM_CHAOS - TEAM_ORDER + 1]
      OrderBuildingStatus.Barracks = false
    end
  else
    L2_121 = Log
    L3_122 = "Could not find Linking barracks!"
    L2_121(L3_122)
  end
  L2_121 = true
  return L2_121
end
TEAM_UNKNOWN = 0
EOG_PAN_TO_NEXUS_TIME = 3
EOG_NEXUS_EXPLOSION_TIME = EOG_PAN_TO_NEXUS_TIME + 0.5
EOG_SCOREBOARD_PHASE_DELAY_TIME = 1.2
EOG_NEXUS_REVIVE_TIME = 10
EOG_ALIVE_NEXUS_SKIN = 0
EOG_DESTROYED_NEXUS_SKIN = 1
EOG_MINION_FADE_AMOUNT = 0
EOG_MINION_FADE_TIME = 2
function EndOfGameCeremony(A0_123, A1_124)
  orderHQ = GetHQ(TEAM_ORDER)
  SetInvulnerable(orderHQ, true)
  SetTargetable(orderHQ, false)
  SetBuildingHealthRegenEnabled(orderHQ, false)
  chaosHQ = GetHQ(TEAM_CHAOS)
  SetInvulnerable(chaosHQ, true)
  SetTargetable(chaosHQ, false)
  SetBuildingHealthRegenEnabled(chaosHQ, false)
  winningTeam = A0_123
  if winningTeam == TEAM_ORDER then
    losingTeam = TEAM_CHAOS
    losingHQPosition = GetPosition(chaosHQ)
    winningHQPosition = GetPosition(orderHQ)
  else
    losingTeam = TEAM_ORDER
    losingHQPosition = GetPosition(orderHQ)
    winningHQPosition = GetPosition(chaosHQ)
  end
  SetInputLockForAllClients(INPUT_LOCK_CAMERA_LOCKING, true)
  SetInputLockForAllClients(INPUT_LOCK_CAMERA_MOVEMENT, true)
  SetInputLockForAllClients(INPUT_LOCK_ABILITIES, true)
  SetInputLockForAllClients(INPUT_LOCK_SUMMONER_SPELLS, true)
  SetInputLockForAllClients(INPUT_LOCK_MOVEMENT, true)
  SetInputLockForAllClients(INPUT_LOCK_SHOP, true)
  SetInputLockForAllClients(INPUT_LOCK_MINIMAP_MOVEMENT, true)
  DisableHUDForEndOfGame()
  SetBarracksSpawnEnabled(false)
  CloseShop()
  HaltAllAI()
  LuaForEachChampion(TEAM_UNKNOWN, "ChampionEoGCeremony")
  Log("Destroy Nexus Called")
  InitTimer("DestroyNexusPhase", EOG_NEXUS_EXPLOSION_TIME, false)
end
function ChampionEoGCeremony(A0_125)
  MoveCameraFromCurrentPositionToPoint(A0_125, losingHQPosition, EOG_PAN_TO_NEXUS_TIME, true)
  SetGreyscaleEnabledWhenDead(A0_125, false)
end
function DestroyNexusPhase()
  if GetEoGUseNexusDeathAnimation() == false then
    SetHQCurrentSkin(losingTeam, EOG_DESTROYED_NEXUS_SKIN)
  end
  FadeMinions(losingTeam, EOG_MINION_FADE_AMOUNT, EOG_MINION_FADE_TIME)
  InitTimer("StopRenderingMinionsPhase", EOG_MINION_FADE_TIME, false)
  InitTimer("ScoreboardPhase", EOG_SCOREBOARD_PHASE_DELAY_TIME, false)
  Log("Destroy Nexus Reached")
end
function StopRenderingMinionsPhase()
  SetMinionsNoRender(losingTeam, true)
end
function ScoreboardPhase()
  Log("Scoreboard reached.")
  SetInputLockForAllClients(INPUT_LOCK_CHAT, true)
  EndGame(winningTeam)
end
EOG_EASTER_EGG_PAN_TO_NEXUS_DELAY = 20
EOG_EASTER_EGG_CAMERA_PATH_TIME = 154
EOG_EASTER_EGG_MUSIC_FADE_TIME = 4
function PostGameSetup(A0_126)
  local L1_127, L2_128, L3_129, L4_130, L5_131
  L1_127 = GetGameMode
  L1_127 = L1_127()
  if L1_127 ~= "ARAM" then
    return
  end
  L2_128 = Make3DPoint
  L3_129 = 2586
  L4_130 = 0
  L5_131 = 1986
  L2_128 = L2_128(L3_129, L4_130, L5_131)
  L3_129 = Make3DPoint
  L4_130 = 10702
  L5_131 = 0
  L3_129 = L3_129(L4_130, L5_131, 10193)
  L4_130 = {
    L5_131,
    Make3DPoint(2500, 0, 2000),
    Make3DPoint(2500, 0, 2000)
  }
  L5_131 = Make3DPoint
  L5_131 = L5_131(5700, 0, 6900)
  L5_131 = {
    Make3DPoint(5700, 0, 6900),
    Make3DPoint(10700, 0, 10700),
    Make3DPoint(10700, 0, 10700)
  }
  if A0_126 == TEAM_CHAOS then
    L2_128, L3_129 = L3_129, L2_128
  end
  POST_GAME_EVENTS = {
    [1] = {delay = EOG_EASTER_EGG_PAN_TO_NEXUS_DELAY},
    [2] = {
      delay = EOG_EASTER_EGG_PAN_TO_NEXUS_DELAY + EOG_EASTER_EGG_MUSIC_FADE_TIME,
      soundCharacterName = "Lissandra",
      soundName = "freljordlore",
      cameraPath = L5_131,
      travelTime = EOG_EASTER_EGG_CAMERA_PATH_TIME
    }
  }
end
function PostGameUpdate(A0_132, A1_133, A2_134)
  local L3_135, L4_136, L5_137, L6_138
  if A1_133 ~= A2_134 then
    return
  end
  for L6_138, _FORV_7_ in L3_135(L4_136) do
    if A0_132 > _FORV_7_.delay then
      if _FORV_7_.cameraLocation then
        ClientSide_CameraMoveCameraFromCurrentPositionToPoint(_FORV_7_.cameraLocation, _FORV_7_.travelTime)
      end
      if _FORV_7_.cameraPath then
        ClientSide_CameraMoveCameraFromCurrentPositionAlongSpline(_FORV_7_.cameraPath, _FORV_7_.travelTime)
      end
      if _FORV_7_.soundName then
        if _FORV_7_.soundCharacterName then
          ClientSide_PlayGenericVOSoundFile(_FORV_7_.soundCharacterName, _FORV_7_.soundName)
        else
          ClientSide_PlaySoundFile(_FORV_7_.soundName)
        end
      end
      table.remove(POST_GAME_EVENTS, L6_138)
      break
    end
  end
end
