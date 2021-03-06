﻿local T, C, L = unpack(ShestakUI)
if C.extra_general.mark_bar ~= true then return end

----------------------------------------------------------------------------------------
--	Mark Bar(by Smelly)
----------------------------------------------------------------------------------------
local button_size = 30

local MarkBarBG = CreateFrame("Frame", "MarkBarAnchor", UIParent)
MarkBarBG:CreatePanel("Invisible", (button_size * 6) + 15, (button_size * 2) + 3, unpack(C.extra_position.mark_bar))
MarkBarBG:SetFrameLevel(0)
tinsert(T.MoverFrames, MarkBarAnchor)

local icon = {}
local mark = {}
for i = 0, 8 do
	mark[i] = CreateFrame("Button", "mark"..i, MarkBarBG)
	mark[i]:CreatePanel("Transparent", button_size, button_size, "LEFT", MarkBarBG, "LEFT", 0, 0)
	if i == 1 then
		mark[i]:SetPoint("TOPLEFT", MarkBarBG, "TOPLEFT", 0, 0)
	elseif i == 5 then
		mark[i]:SetPoint("TOP", mark[1], "BOTTOM", 0, -3)
	else
		mark[i]:SetPoint("LEFT", mark[i-1], "RIGHT", 3, 0)
	end
	mark[0]:SetPoint("TOPLEFT", mark[4], "TOPRIGHT", 3, 0)
	mark[i]:EnableMouse(true)
	mark[i]:SetScript("OnEnter", T.SetModifiedBackdrop)
	mark[i]:SetScript("OnLeave", T.SetOriginalBackdrop)
	mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", i) end)

	icon[i] = CreateFrame("Button", "icon"..i, MarkBarBG)
	if i == 0 then
		icon[i]:SetNormalTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Up")
	else
		icon[i]:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
	end
	icon[i]:Size(button_size - 5, button_size - 5)
	icon[i]:Point("CENTER", mark[i])

	-- Set up each button
	if i == 1 then
		icon[i]:GetNormalTexture():SetTexCoord(0, 0.25, 0, 0.25)
	elseif i == 2 then
		icon[i]:GetNormalTexture():SetTexCoord(0.25, 0.5, 0, 0.25)
	elseif i == 3 then
		icon[i]:GetNormalTexture():SetTexCoord(0.5, 0.75, 0, 0.25)
	elseif i == 4 then
		icon[i]:GetNormalTexture():SetTexCoord(0.75, 1, 0, 0.25)
	elseif i == 5 then
		icon[i]:GetNormalTexture():SetTexCoord(0, 0.25, 0.25, 0.5)
	elseif i == 6 then
		icon[i]:GetNormalTexture():SetTexCoord(0.25, 0.5, 0.25, 0.5)
	elseif i == 7 then
		icon[i]:GetNormalTexture():SetTexCoord(0.5, 0.75, 0.25, 0.5)
	elseif i == 8 then
		icon[i]:GetNormalTexture():SetTexCoord(0.75, 1, 0.25, 0.5)
	end
end

-- Create ReadyCheck Button
local ReadyCheckButton = CreateFrame("Button", "ReadyCheckButton", MarkBarAnchor)
ReadyCheckButton:CreatePanel("Transparent", button_size, button_size, "TOPLEFT", mark[8], "TOPRIGHT", 3, 0)
ReadyCheckButton:SetScript("OnEnter", T.SetModifiedBackdrop)
ReadyCheckButton:SetScript("OnLeave", T.SetOriginalBackdrop)
ReadyCheckButton:SetScript("OnMouseUp", function() DoReadyCheck() end)

local ReadyCheckButtonTexture = ReadyCheckButton:CreateTexture(nil, "OVERLAY")
ReadyCheckButtonTexture:SetTexture(READY_CHECK_READY_TEXTURE)
ReadyCheckButtonTexture:SetAllPoints(ReadyCheckButton)

-- Create WorldMark Button
local WorldMarkButton = CreateFrame("Button", "WorldMarkButton", MarkBarAnchor, "SecureActionButtonTemplate")
WorldMarkButton:CreatePanel("Transparent", button_size, button_size, "TOPLEFT", mark[0], "TOPRIGHT", 3, 0)
WorldMarkButton:SetScript("OnEnter", T.SetModifiedBackdrop)
WorldMarkButton:SetScript("OnLeave", T.SetOriginalBackdrop)
WorldMarkButton:SetAttribute("type1", "macro")
WorldMarkButton:SetAttribute("macrotext1", "/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton")
WorldMarkButton:HookScript("OnClick", function(self)
	DropDownList1:ClearAllPoints()
	DropDownList1:Point("TOPRIGHT", self, "BOTTOMRIGHT", 2, -4)
end)

local WorldMarkButtonTexture = WorldMarkButton:CreateTexture(nil, "OVERLAY")
WorldMarkButtonTexture:SetTexture("Interface\\RaidFrame\\Raid-WorldPing")
WorldMarkButtonTexture:Point("CENTER", 0, 0)
WorldMarkButtonTexture:SetHeight(23)
WorldMarkButtonTexture:SetWidth(23)

-- Create Pull Button
local PullTargetButton = CreateFrame("Frame", "PullTargetButton", MarkBarAnchor)
PullTargetButton:CreatePanel("Transparent", button_size, button_size, "TOP", WorldMarkButton, "BOTTOM", 0, -3)
PullTargetButton:SetScript("OnEnter", T.SetModifiedBackdrop)
PullTargetButton:SetScript("OnLeave", T.SetOriginalBackdrop)
PullTargetButton:SetScript("OnMouseUp", function() PullCountdown.Pull(3) end)

local PullTargetButtonTexture = PullTargetButton:CreateTexture(nil, "OVERLAY")
PullTargetButtonTexture:SetTexture("Interface\\Icons\\Ability_Hunter_Beastcall")
PullTargetButtonTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
PullTargetButtonTexture:Point("TOPLEFT", PullTargetButton, 2, -2)
PullTargetButtonTexture:Point("BOTTOMRIGHT", PullTargetButton, -2, 2)

-- Check if we are Raid Leader/Officer or in Party
local function CheckRaidStatus()
	local inInstance, instanceType = IsInInstance()
	local partyMembers = GetNumPartyMembers()
 
	if not UnitInRaid("player") and partyMembers >= 1 then return true
	elseif UnitIsRaidOfficer("player") then return true
	elseif not inInstance or instanceType == "pvp" or instanceType == "arena" then return false
	end
end

-- Automatically show/hide the frame if we have Raid Leader or Raid Officer or in Party
local LeadershipCheck = CreateFrame("Frame")
LeadershipCheck:RegisterEvent("RAID_ROSTER_UPDATE")
LeadershipCheck:RegisterEvent("PARTY_MEMBERS_CHANGED")
LeadershipCheck:RegisterEvent("PLAYER_ENTERING_WORLD")
LeadershipCheck:SetScript("OnEvent", function(self, event)
	if InCombatLockdown() then
		self:RegisterEvent("PLAYER_REGEN_ENABLED")
		return
	end

	if CheckRaidStatus() then
		MarkBarAnchor:Show()
	else
		MarkBarAnchor:Hide()
	end

	if event == "PLAYER_REGEN_ENABLED" then
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	end
end)