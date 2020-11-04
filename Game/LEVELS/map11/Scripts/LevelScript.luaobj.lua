EOG_SCOREBOARD_PHASE_DELAY_TIME = 1.2
MAX_MINIONS_EVER = 180
TEAM_UNKNOWN = 0
TEAM_ORDER = 100
TEAM_CHAOS = 200
TEAM_NEUTRAL = 300
ORDER_HQ = 1
CHAOS_HQ = 2
FRONT_TOWER = 3
MIDDLE_TOWER = 2
BACK_TOWER = 1
HQ_TOWER2 = 4
HQ_TOWER1 = 5
RIGHT_LANE = 0
CENTER_LANE = 1
LEFT_LANE = 2
INITIAL_TIME_TO_SPAWN = 90
CANNON_MINION_SPAWN_FREQUENCY = 3
INCREASE_CANNON_RATE_TIMER = 1200
INCREASE_CANNON_RATE_TIMER2 = 2100
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
SPECIAL_MINION_MODE = "none"
HQTurretAttackable = false
UpgradedMinionIterations = 0
DoLuaLevel("BBLuaConversionLibrary")
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
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 19.8,
  GoldBonus = 0,
  GoldUpgrade = 0.2,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 12,
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
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 14.8,
  GoldBonus = 0,
  GoldUpgrade = 0.2,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 8,
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
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 39.5,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
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
  GoldGiven = 39.5,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
OrderMeleeMinionInfo = {
  MinionName = "SRU_OrderMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
ChaosMeleeMinionInfo = {
  MinionName = "SRU_ChaosMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
OrderCasterMinionInfo = {
  MinionName = "SRU_OrderMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
ChaosCasterMinionInfo = {
  MinionName = "SRU_ChaosMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
OrderCannonMinionInfo = {
  MinionName = "SRU_OrderMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
ChaosCannonMinionInfo = {
  MinionName = "SRU_ChaosMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
OrderSuperMinionInfo = {
  MinionName = "SRU_OrderMinionSuper",
  DefaultInfo = SuperDefaultMinionInfo
}
ChaosSuperMinionInfo = {
  MinionName = "SRU_ChaosMinionSuper",
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
NeutralMinionNames = {
  "SRU_Dragon",
  "SRU_Krug",
  "SRU_KrugMini",
  "SRU_Red",
  "SRU_RedMini",
  "SRU_Razorbeak",
  "SRU_RazorbeakMini",
  "SRU_Murkwolf",
  "SRU_MurkwolfMini",
  "SRU_Blue",
  "SRU_BlueMini",
  "SRU_Gromp",
  "SRU_Baron"
}
function CreateLaneBuildingTable()
  local L0_21, L1_22
  L0_21 = {}
  L0_21.Turret3 = true
  L0_21.Turret2 = true
  L0_21.Turret1 = true
  L0_21.Barracks = true
  return L0_21
end
OrderBuildingStatus = {
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  HQTower2 = true,
  HQTower1 = true,
  HQ = true
}
ChaosBuildingStatus = {
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  HQTower2 = true,
  HQTower1 = true,
  HQ = true
}
TotalNumberOfMinions = 0
totalNumberOfChaosBarracks = 3
totalNumberOfOrderBarracks = 3
function PreloadBarrackCharacters(A0_23)
  local L1_24, L2_25
  for _FORV_6_, _FORV_7_ in pairs(A0_23.DefaultMinionInfoTable) do
    if _FORV_7_.PreloadedCharacter == nil then
      _FORV_7_.PreloadedCharacter = 1
      PreloadCharacter(_FORV_7_.MinionName)
    end
  end
end
function SuppressMinionSpawnForBarrack(A0_26)
  for _FORV_4_, _FORV_5_ in pairs(DefaultBarrackInfo.SpawnOrderMinionNames) do
    A0_26.MinionInfoTable[_FORV_5_].NumPerWave = 0
  end
end
function SetMutatorGlobals()
  local L0_27, L1_28
end
function OnLevelInit()
  local L0_29, L1_30, L2_31, L3_32, L4_33, L5_34, L6_35
  for L5_34, L6_35 in L2_31(L3_32) do
    PreloadBarrackCharacters(L6_35)
  end
  for L5_34, L6_35 in L2_31(L3_32) do
    PreloadBarrackCharacters(L6_35)
  end
  L2_31()
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L6_35 = L3_32()
  L2_31(L3_32, L4_33, L5_34, L6_35, L3_32())
  L3_32(L4_33)
  L3_32()
  L3_32(L4_33)
end
function OnLevelInitServer()
  InitTimer("UpgradeMinionTimer", UPGRADE_MINION_TIMER, true)
  InitTimer("IncreaseCannonMinionSpawnRate", INCREASE_CANNON_RATE_TIMER, false)
  InitTimer("IncreaseCannonMinionSpawnRateAgain", INCREASE_CANNON_RATE_TIMER2, false)
  InitTimer("AllowDamageOnBuildings", 10, false)
end
function OnPostLevelLoad()
  local L0_36, L1_37, L2_38, L3_39, L4_40, L5_41
  L0_36 = GetMutatorParameterString
  L0_36 = L0_36(L1_37)
  L1_37(L2_38)
  L1_37()
  for L4_40 = RIGHT_LANE, LEFT_LANE do
    L5_41 = GetDampener
    L5_41 = L5_41(TEAM_ORDER, L4_40)
    SetDampenerRespawnAnimationDuration(L5_41, ORDER_INHIBITOR_RESPAWN_ANIMATION_DURATION)
    L5_41 = GetDampener(TEAM_CHAOS, L4_40)
    SetDampenerRespawnAnimationDuration(L5_41, CHAOS_INHIBITOR_RESPAWN_ANIMATION_DURATION)
    SetLaneExposed(TEAM_ORDER, L4_40, false)
    SetLaneExposed(TEAM_CHAOS, L4_40, false)
    SetLaneTowerCount(TEAM_ORDER, L4_40, 3)
    SetLaneTowerCount(TEAM_CHAOS, L4_40, 3)
  end
  L1_37(L2_38)
  L1_37(L2_38)
  L1_37(L2_38, L3_39)
  L1_37(L2_38, L3_39)
  L1_37(L2_38, L3_39)
end
function OnGameStartup()
  local L0_42
  L0_42 = 0
  OrderHQPos = GetKeyLocation(L0_42, TEAM_ORDER)
  ChaosHQPos = GetKeyLocation(L0_42, TEAM_CHAOS)
end
function SetShieldBuffsOnSecondaryTurrets(A0_43)
  local L1_44, L2_45, L3_46, L4_47
  for L4_47 = RIGHT_LANE, LEFT_LANE do
    if L4_47 ~= CENTER_LANE then
      innerTurret = GetTurret(A0_43, L4_47, MIDDLE_TOWER)
      ApplyPersistentBuff(innerTurret, "SRTurretSecondaryShielder", false, 1, 1)
      AddBuffCounter(innerTurret, "SRTurretSecondaryShielder", L4_47, 2)
    end
  end
end
SPELLBOOK_SUMMONER = 1
function ApplyJungleTracker(A0_48)
  if GetSlotSpellName(A0_48, 0, SPELLBOOK_SUMMONER, 0) == "summonersmite" or GetSlotSpellName(A0_48, 1, SPELLBOOK_SUMMONER, 0) == "summonersmite" then
    ApplyPersistentBuff(A0_48, "ItemJungleStatsTracker", true, 1, 1)
  end
end
function ApplyBaseBuffToAllChampions()
  LuaForEachChampion(TEAM_CHAOS, "ApplyBaseBuffChaos")
  LuaForEachChampion(TEAM_ORDER, "ApplyBaseBuffOrder")
end
function ApplyBaseBuffChaos(A0_49)
  ApplyBaseBuff(A0_49, ChaosHQPos)
end
function ApplyBaseBuffOrder(A0_50)
  ApplyBaseBuff(A0_50, OrderHQPos)
end
baseBuffRadiusSquared = 12250000
BUFF_Aura = 1
function ApplyBaseBuff(A0_51, A1_52)
  if (GetPosition(A0_51) - A1_52):lengthSq() < baseBuffRadiusSquared then
    SpellBuffAdd(A0_51, A0_51, "S5Test_BaseBuff", BUFF_Aura, 1, 0.5, nil)
  end
end
function OppositeTeam(A0_53)
  if A0_53 == TEAM_CHAOS then
    return TEAM_ORDER
  else
    return TEAM_CHAOS
  end
end
function UpgradeMinionTimer()
  local L0_54, L1_55, L2_56, L3_57, L4_58, L5_59, L6_60, L7_61, L8_62, L9_63, L10_64, L11_65
  UpgradedMinionIterations = L1_55
  L1_55(L2_56, L3_57)
  for L4_58 = 1, 2 do
    if L4_58 == 1 then
      L0_54 = OrderBarracksBonuses
    else
      L0_54 = ChaosBarracksBonuses
    end
    for L8_62 = 1, 3 do
      L9_63, L10_64 = nil, nil
      L11_65 = L0_54[L8_62]
      L11_65 = L11_65.MinionInfoTable
      for _FORV_15_, _FORV_16_ in pairs(L11_65) do
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
function AllowDamageOnBuildings()
  local L0_66, L1_67, L2_68, L3_69, L4_70, L5_71, L6_72, L7_73
  for L3_69 = RIGHT_LANE, LEFT_LANE do
    for L7_73 = BACK_TOWER, HQ_TOWER1 do
      orderTurret = GetTurret(TEAM_ORDER, L3_69, L7_73)
      if orderTurret ~= nil then
        if L7_73 == FRONT_TOWER then
          SetInvulnerable(orderTurret, false)
          SetTargetable(orderTurret, true)
        else
          SetInvulnerable(orderTurret, true)
          SetNotTargetableToTeam(orderTurret, true, TEAM_CHAOS)
        end
      end
      chaosTurret = GetTurret(TEAM_CHAOS, L3_69, L7_73)
      if chaosTurret ~= nil then
        if L7_73 == FRONT_TOWER then
          SetInvulnerable(chaosTurret, false)
          SetTargetable(chaosTurret, true)
        else
          SetInvulnerable(chaosTurret, true)
          SetNotTargetableToTeam(chaosTurret, true, TEAM_ORDER)
        end
      end
    end
  end
end
function ResetToDefaultWaveCounts(A0_74)
  local L1_75, L2_76
  for _FORV_6_, _FORV_7_ in pairs(A0_74) do
    _FORV_7_.NumPerWave = _FORV_7_.DefaultNumPerWave
  end
end
function ClearCurrentWaveCounts(A0_77)
  local L1_78, L2_79
  for _FORV_6_, _FORV_7_ in pairs(A0_77) do
    _FORV_7_.NumPerWave = 0
  end
end
function GetInitSpawnInfo(A0_80, A1_81)
  local L2_82, L3_83, L4_84
  L2_82 = 0
  L3_83 = TEAM_ORDER
  if A1_81 == L3_83 then
    L3_83 = OrderBarracksBonuses
    L4_84 = A0_80 + 1
    L2_82 = L3_83[L4_84]
  else
    L3_83 = ChaosBarracksBonuses
    L4_84 = A0_80 + 1
    L2_82 = L3_83[L4_84]
  end
  L3_83 = {}
  L4_84 = SpawnTable
  L4_84 = L4_84.WaveSpawnRate
  L3_83.WaveSpawnRate = L4_84
  L4_84 = SpawnTable
  L4_84 = L4_84.SingleMinionSpawnDelay
  L3_83.SingleMinionSpawnDelay = L4_84
  L4_84 = L2_82.IsDestroyed
  L3_83.IsDestroyed = L4_84
  L4_84 = L2_82.MinionInfoTable
  L3_83.MinionInfoTable = L4_84
  ReturnTable = L3_83
  L3_83 = ReturnTable
  return L3_83
end
function GetMinionSpawnInfo(A0_85, A1_86, A2_87, A3_88, A4_89)
  local L5_90, L6_91, L7_92
  L5_90 = 0
  L6_91 = TEAM_ORDER
  if A3_88 == L6_91 then
    L6_91 = OrderBarracksBonuses
    L7_92 = A0_85 + 1
    L5_90 = L6_91[L7_92]
  else
    L6_91 = ChaosBarracksBonuses
    L7_92 = A0_85 + 1
    L5_90 = L6_91[L7_92]
  end
  L6_91 = L5_90.MinionInfoTable
  L6_91 = L6_91.Super
  L7_92 = L5_90.MinionInfoTable
  L7_92 = L7_92.Cannon
  ResetToDefaultWaveCounts(L5_90.MinionInfoTable)
  if A1_86 % CANNON_MINION_SPAWN_FREQUENCY == 0 then
    L7_92.NumPerWave = L7_92.NumPerWave + 1
  end
  if A4_89 ~= LAST_WAVE then
    BARRACKSCOUNT = 6
    totalMinionsRemaining = MAX_MINIONS_EVER - GetTotalTeamMinionsSpawned()
    if totalMinionsRemaining <= BARRACKSCOUNT * 7 then
      if 0 >= totalMinionsRemaining then
        SPECIAL_MINION_MODE = "None"
      elseif totalMinionsRemaining >= BARRACKSCOUNT then
        SPECIAL_MINION_MODE = "2MeleeMinions"
      else
        SPECIAL_MINION_MODE = "None"
      end
    else
      SPECIAL_MINION_MODE = ""
    end
    LAST_WAVE = A4_89
  end
  if L5_90.WillSpawnSuperMinion == 1 then
    if A3_88 == TEAM_ORDER and totalNumberOfChaosBarracks == 0 or A3_88 == TEAM_CHAOS and totalNumberOfOrderBarracks == 0 then
      L6_91.NumPerWave = 2
    else
      L6_91.NumPerWave = 1
    end
    L7_92.NumPerWave = 0
  end
  if SPECIAL_MINION_MODE == "2MeleeMinions" then
    ClearCurrentWaveCounts(L5_90.MinionInfoTable)
    L6_91.NumPerWave = L5_90.MinionInfoTable.Super.NumPerWave
    L5_90.MinionInfoTable.Melee.NumPerWave = math.max(2 - L5_90.MinionInfoTable.Super.NumPerWave, 0)
  elseif SPECIAL_MINION_MODE == "None" then
    ClearCurrentWaveCounts(L5_90.MinionInfoTable)
  end
  if GetMutatorParameterBool("SuppressMinionSpawn") then
    SuppressMinionSpawnForBarrack(L5_90)
  end
  ReturnTable = {
    NewFormat = true,
    SpawnOrderMinionNames = L5_90.SpawnOrderMinionNames,
    IsDestroyed = L5_90.IsDestroyed,
    ExperienceRadius = SpawnTable.ExpRadius,
    GoldRadius = SpawnTable.GoldRadius,
    MinionInfoTable = L5_90.MinionInfoTable
  }
  return ReturnTable
end
function DeactivateCorrectStructure(A0_93, A1_94, A2_95)
  local L3_96, L4_97
  L4_97 = TEAM_ORDER
  if A0_93 == L4_97 then
    L3_96 = OrderBuildingStatus
  else
    L3_96 = ChaosBuildingStatus
  end
  L4_97 = FRONT_TOWER
  if A2_95 == L4_97 then
    L4_97 = A1_94 + 1
    L4_97 = L3_96[L4_97]
    L4_97.Turret3 = false
    L4_97 = GetTurret
    L4_97 = L4_97(A0_93, A1_94, MIDDLE_TOWER)
    SetInvulnerable(L4_97, false)
    SetTargetable(L4_97, true)
    SetLaneTowerCount(A0_93, A1_94, 2)
  else
    L4_97 = MIDDLE_TOWER
    if A2_95 == L4_97 then
      L4_97 = A1_94 + 1
      L4_97 = L3_96[L4_97]
      L4_97.Turret2 = false
      L4_97 = GetTurret
      L4_97 = L4_97(A0_93, A1_94, BACK_TOWER)
      SetInvulnerable(L4_97, false)
      SetTargetable(L4_97, true)
      SetLaneTowerCount(A0_93, A1_94, 1)
    else
      L4_97 = BACK_TOWER
      if A2_95 == L4_97 then
        L4_97 = A1_94 + 1
        L4_97 = L3_96[L4_97]
        L4_97.Turret1 = false
        L4_97 = GetDampener
        L4_97 = L4_97(A0_93, A1_94)
        SetInvulnerable(L4_97, false)
        SetTargetable(L4_97, true)
        SetLaneTowerCount(A0_93, A1_94, 0)
      else
        L4_97 = HQ_TOWER2
        if A2_95 == L4_97 then
          L3_96.HQTower2 = false
          L4_97 = L3_96.HQTower1
          if L4_97 == false then
            L4_97 = GetHQ
            L4_97 = L4_97(A0_93)
            SetInvulnerable(L4_97, false)
            SetTargetable(L4_97, true)
          end
        else
          L4_97 = HQ_TOWER1
          if A2_95 == L4_97 then
            L3_96.HQTower1 = false
            L4_97 = L3_96.HQTower2
            if L4_97 == false then
              L4_97 = GetHQ
              L4_97 = L4_97(A0_93)
              SetInvulnerable(L4_97, false)
              SetTargetable(L4_97, true)
            end
          end
        end
      end
    end
  end
end
function GetLuaBarracks(A0_98, A1_99)
  local L2_100, L3_101, L4_102
  L3_101 = TEAM_ORDER
  if A0_98 == L3_101 then
    L3_101 = OrderBarracksBonuses
    L4_102 = A1_99 + 1
    L2_100 = L3_101[L4_102]
  else
    L3_101 = ChaosBarracksBonuses
    L4_102 = A1_99 + 1
    L2_100 = L3_101[L4_102]
  end
  return L2_100
end
function GetDisableMinionSpawnTime(A0_103, A1_104)
  barrack = GetLuaBarracks(A1_104, A0_103)
  return DISABLE_MINION_SPAWN_BASE_TIME + DISABLE_MINION_SPAWN_MAG_TIME * barrack.NumOfSpawnDisables
end
function DisableBarracksSpawn(A0_105, A1_106)
  cLangBarracks = GetBarracks(A1_106, A0_105)
  luaBarrack = GetLuaBarracks(A1_106, A0_105)
  SetDisableMinionSpawn(cLangBarracks, GetDisableMinionSpawnTime(A0_105, A1_106))
  luaBarrack.NumOfSpawnDisables = luaBarrack.NumOfSpawnDisables + 1
end
BonusesCounter = 0
function ApplyBarracksDestructionBonuses(A0_107, A1_108)
  local L2_109, L3_110, L4_111, L5_112, L6_113, L7_114, L8_115, L9_116, L10_117
  BonusesCounter = L2_109
  for L5_112 = 1, 3 do
    L6_113, L7_114 = nil, nil
    L8_115 = TEAM_ORDER
    if A0_107 == L8_115 then
      L7_114 = TEAM_CHAOS
      L6_113 = OrderBarracksBonuses
      L8_115 = ChaosBarracksBonuses
      EnemyBarracks = L8_115
    else
      L7_114 = TEAM_ORDER
      L6_113 = ChaosBarracksBonuses
      L8_115 = OrderBarracksBonuses
      EnemyBarracks = L8_115
    end
    L8_115, L9_116 = nil, nil
    L10_117 = L6_113[L5_112]
    L10_117 = L10_117.MinionInfoTable
    for _FORV_14_, _FORV_15_ in pairs(L10_117) do
      _FORV_15_.HPBonus = _FORV_15_.HPBonus + _FORV_15_.HPInhibitor
      _FORV_15_.DamageBonus = _FORV_15_.DamageBonus + _FORV_15_.DamageInhibitor
      _FORV_15_.ExpGiven = _FORV_15_.ExpGiven - _FORV_15_.ExpInhibitor
      _FORV_15_.GoldGiven = _FORV_15_.GoldGiven - _FORV_15_.GoldInhibitor
    end
    if L5_112 == A1_108 + 1 then
      L6_113[L5_112].WillSpawnSuperMinion = 1
      if A0_107 == TEAM_ORDER then
        totalNumberOfChaosBarracks = totalNumberOfChaosBarracks - 1
      else
        totalNumberOfOrderBarracks = totalNumberOfOrderBarracks - 1
      end
    end
  end
end
ReductionCounter = 0
function ApplyBarracksRespawnReductions(A0_118, A1_119)
  local L2_120, L3_121, L4_122, L5_123, L6_124, L7_125, L8_126, L9_127, L10_128, L11_129, L12_130, L13_131, L14_132, L15_133, L16_134, L17_135, L18_136
  ReductionCounter = L2_120
  for L5_123 = 1, 3 do
    L6_124, L7_125, L8_126 = nil, nil, nil
    L9_127 = TEAM_ORDER
    if A0_118 == L9_127 then
      L8_126 = TEAM_CHAOS
      L6_124 = OrderBarracksBonuses
      L7_125 = ChaosBarracksBonuses
    else
      L8_126 = TEAM_ORDER
      L6_124 = ChaosBarracksBonuses
      L7_125 = OrderBarracksBonuses
    end
    L9_127, L10_128 = nil, nil
    L11_129 = L6_124[L5_123]
    L11_129 = L11_129.MinionInfoTable
    for L15_133, L16_134 in L12_130(L13_131) do
      L17_135 = L16_134.HPBonus
      L18_136 = L16_134.HPInhibitor
      L17_135 = L17_135 - L18_136
      L16_134.HPBonus = L17_135
      L17_135 = L16_134.DamageBonus
      L18_136 = L16_134.DamageInhibitor
      L17_135 = L17_135 - L18_136
      L16_134.DamageBonus = L17_135
      L17_135 = L16_134.ExpGiven
      L18_136 = L16_134.ExpInhibitor
      L17_135 = L17_135 + L18_136
      L16_134.ExpGiven = L17_135
      L17_135 = L16_134.GoldGiven
      L18_136 = L16_134.GoldInhibitor
      L17_135 = L17_135 + L18_136
      L16_134.GoldGiven = L17_135
    end
    if L5_123 == L13_131 then
      if A0_118 == L13_131 then
        totalNumberOfChaosBarracks = L13_131
      else
        totalNumberOfOrderBarracks = L13_131
      end
      L13_131.WillSpawnSuperMinion = 0
      L16_134 = false
      L13_131(L14_132, L15_133, L16_134)
    end
    if L12_130 == 3 then
      HQ = L13_131
      L13_131(L14_132, L15_133)
      L13_131(L14_132, L15_133)
      for L16_134 = RIGHT_LANE, LEFT_LANE do
        L17_135 = GetTurret
        L18_136 = L8_126
        L17_135 = L17_135(L18_136, L16_134, HQ_TOWER1)
        L18_136 = GetTurret
        L18_136 = L18_136(L8_126, L16_134, HQ_TOWER2)
        if L17_135 ~= Nil then
          SetInvulnerable(L17_135, true)
          SetNotTargetableToTeam(L17_135, true, A0_118)
        end
        if L18_136 ~= Nil then
          SetInvulnerable(L18_136, true)
          SetNotTargetableToTeam(L18_136, true, A0_118)
        end
      end
    end
  end
end
ReactiveCounter = 0
function BarrackReactiveEvent(A0_137, A1_138)
  local L2_139
  ReactiveCounter = ReactiveCounter + 1
  L2_139 = OppositeTeam(A0_137)
  dampener = GetDampener(A0_137, A1_138)
  SetInvulnerable(dampener, false)
  SetTargetable(dampener, true)
  ApplyBarracksRespawnReductions(L2_139, A1_138)
end
function DisableSuperMinions(A0_140, A1_141)
  local L2_142, L3_143
  if A0_140 == TEAM_ORDER then
    L2_142 = OrderBarracksBonuses[A1_141 + 1]
    L3_143 = ChaosBarracksBonuses[A1_141 + 1]
  elseif A0_140 == TEAM_CHAOS then
    L2_142 = ChaosBarracksBonuses[A1_141 + 1]
    L3_143 = OrderBarracksBonuses[A1_141 + 1]
  end
  if L3_143 then
    L3_143.WillSpawnSuperMinion = 0
  end
end
function OnJumpToMidGameCheat(A0_144)
  local L1_145
  L1_145 = GetTurret
  L1_145 = L1_145(TEAM_ORDER, 1, HQ_TOWER1)
  if A0_144 == 0 then
    ApplyPersistentBuff(L1_145, "DebugMidGameBuff", false, 1, 1)
  else
    ApplyPersistentBuff(L1_145, "DebugLateGameBuff", false, 1, 1)
  end
end
function OnBarracksToggled(A0_146)
  local L1_147
  if A0_146 == 0 then
  end
end
DisactivatedCounter = 0
function HandleDestroyedObject(A0_148)
  local L1_149, L2_150, L3_151
  L1_149 = GetHQType
  L2_150 = A0_148
  L1_149 = L1_149(L2_150)
  HQType = L1_149
  L1_149 = HQType
  L2_150 = ORDER_HQ
  if L1_149 ~= L2_150 then
    L1_149 = HQType
    L2_150 = CHAOS_HQ
  elseif L1_149 == L2_150 then
    L1_149 = HQType
    L2_150 = CHAOS_HQ
    if L1_149 == L2_150 then
      L1_149 = EndOfGameCeremony
      L2_150 = TEAM_ORDER
      L3_151 = A0_148
      L1_149(L2_150, L3_151)
    else
      L1_149 = EndOfGameCeremony
      L2_150 = TEAM_CHAOS
      L3_151 = A0_148
      L1_149(L2_150, L3_151)
    end
    return
  end
  L1_149 = IsDampener
  L2_150 = A0_148
  L1_149 = L1_149(L2_150)
  if L1_149 then
    L1_149 = GetLinkedBarrack
    L2_150 = A0_148
    L1_149 = L1_149(L2_150)
    barrack = L1_149
    L1_149 = GetTeamID
    L2_150 = barrack
    L1_149 = L1_149(L2_150)
    barrackTeam = L1_149
    L1_149 = GetLane
    L2_150 = A0_148
    L1_149 = L1_149(L2_150)
    barrackLane = L1_149
    L1_149 = SetLaneExposed
    L2_150 = barrackTeam
    L3_151 = barrackLane
    L1_149(L2_150, L3_151, true)
    L1_149 = DisableBarracksSpawn
    L2_150 = barrackLane
    L3_151 = barrackTeam
    L1_149(L2_150, L3_151)
    L1_149 = SetDampenerState
    L2_150 = A0_148
    L3_151 = DampenerRegenerationState
    L1_149(L2_150, L3_151)
    L1_149 = SetInvulnerable
    L2_150 = A0_148
    L3_151 = true
    L1_149(L2_150, L3_151)
    L1_149 = SetTargetable
    L2_150 = A0_148
    L3_151 = false
    L1_149(L2_150, L3_151)
    L1_149 = DisactivatedCounter
    L1_149 = L1_149 + 1
    DisactivatedCounter = L1_149
    L1_149 = GetTurret
    L2_150 = barrackTeam
    L3_151 = 1
    L1_149 = L1_149(L2_150, L3_151, HQ_TOWER1)
    L2_150 = GetTurret
    L3_151 = barrackTeam
    L2_150 = L2_150(L3_151, 1, HQ_TOWER2)
    L3_151 = Nil
    if L1_149 ~= L3_151 then
      L3_151 = SetInvulnerable
      L3_151(L1_149, false)
      L3_151 = SetTargetable
      L3_151(L1_149, true)
    end
    L3_151 = Nil
    if L2_150 ~= L3_151 then
      L3_151 = SetInvulnerable
      L3_151(L2_150, false)
      L3_151 = SetTargetable
      L3_151(L2_150, true)
    end
    L3_151 = Nil
    if L1_149 == L3_151 then
      L3_151 = Nil
      if L2_150 == L3_151 then
        L3_151 = GetHQ
        L3_151 = L3_151(barrackTeam)
        SetInvulnerable(L3_151, false)
        SetTargetable(L3_151, true)
      end
    end
    L3_151 = nil
    if barrackTeam == TEAM_CHAOS then
      L3_151 = TEAM_ORDER
    else
      L3_151 = TEAM_CHAOS
    end
    ApplyBarracksDestructionBonuses(L3_151, barrackLane)
  end
  L1_149 = IsTurretAI
  L2_150 = A0_148
  L1_149 = L1_149(L2_150)
  if L1_149 then
    L1_149 = GetTeamID
    L2_150 = A0_148
    L1_149 = L1_149(L2_150)
    L2_150 = GetObjectLaneId
    L3_151 = A0_148
    L2_150 = L2_150(L3_151)
    L3_151 = GetTurretPosition
    L3_151 = L3_151(A0_148)
    DeactivateCorrectStructure(L1_149, L2_150, L3_151)
    return
  end
  L1_149 = GetDampenerType
  L2_150 = A0_148
  L1_149 = L1_149(L2_150)
  if L1_149 > -1 then
    L2_150 = 0
    L3_151 = TEAM_ORDER
    if L1_149 % TEAM_CHAOS >= RIGHT_LANE and L1_149 % TEAM_CHAOS <= LEFT_LANE then
      L2_150 = ChaosBarracksBonuses[L1_149 % TEAM_CHAOS + 1]
      ChaosBuildingStatus[L1_149 % TEAM_CHAOS + 1].Barracks = false
    else
      L3_151 = TEAM_CHAOS
      L2_150 = OrderBarracksBonuses[L1_149 % TEAM_CHAOS - TEAM_ORDER + 1]
      OrderBuildingStatus[L1_149 % TEAM_CHAOS - TEAM_ORDER + 1].Barracks = false
    end
  else
    L2_150 = Log
    L3_151 = "Could not find Linking barracks!"
    L2_150(L3_151)
  end
  L2_150 = true
  return L2_150
end
function SetLaneExposed(A0_152, A1_153, A2_154)
  if A0_152 == TEAM_ORDER then
    if A1_153 == LEFT_LANE then
      SetWorldVar("OrderTopLaneExposed", A2_154)
    elseif A1_153 == RIGHT_LANE then
      SetWorldVar("OrderBotLaneExposed", A2_154)
    else
      SetWorldVar("OrderMidLaneExposed", A2_154)
    end
  elseif A1_153 == LEFT_LANE then
    SetWorldVar("ChaosTopLaneExposed", A2_154)
  elseif A1_153 == RIGHT_LANE then
    SetWorldVar("ChaosBotLaneExposed", A2_154)
  else
    SetWorldVar("ChaosMidLaneExposed", A2_154)
  end
end
function SetLaneTowerCount(A0_155, A1_156, A2_157)
  if A0_155 == TEAM_ORDER then
    if A1_156 == LEFT_LANE then
      SetWorldVar("OrderTopLaneTowerCount", A2_157)
    elseif A1_156 == RIGHT_LANE then
      SetWorldVar("OrderBotLaneTowerCount", A2_157)
    else
      SetWorldVar("OrderMidLaneTowerCount", A2_157)
    end
  elseif A1_156 == LEFT_LANE then
    SetWorldVar("ChaosTopLaneTowerCount", A2_157)
  elseif A1_156 == RIGHT_LANE then
    SetWorldVar("ChaosBotLaneTowerCount", A2_157)
  else
    SetWorldVar("ChaosMidLaneTowerCount", A2_157)
  end
end
function IncreaseCannonMinionSpawnRate()
  local L1_158
  L1_158 = 2
  CANNON_MINION_SPAWN_FREQUENCY = L1_158
end
function IncreaseCannonMinionSpawnRateAgain()
  local L1_159
  L1_159 = 1
  CANNON_MINION_SPAWN_FREQUENCY = L1_159
end
function PostGameSetup(A0_160)
  POST_GAME_EVENTS = {}
end
function PostGameUpdate(A0_161, A1_162)
  local L2_163, L3_164, L4_165, L5_166, L6_167, L7_168
  for L7_168, _FORV_8_ in L4_165(L5_166) do
    if A0_161 > _FORV_8_.delay then
      ClientSide_CameraMoveCameraFromCurrentPositionToPoint(_FORV_8_.cameraLocation, _FORV_8_.travelTime)
      if _FORV_8_.soundFile then
        ClientSide_PlaySoundFile(_FORV_8_.soundFile)
      end
      table.remove(POST_GAME_EVENTS, L7_168)
      break
    end
  end
end
