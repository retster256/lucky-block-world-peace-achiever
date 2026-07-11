--vuln which tps baseparts to 0,0,0

local rem = game:GetService("ReplicatedStorage").BloxbizRemotes.CatalogOnApplyOutfit


function reset_pos(base_part)
	rem:FireServer(
		{
			Accessories = {
				base_part
			}
		}
	)
end

for _, player in pairs(game.Players:GetPlayers()) do
	spawn(function()
		if true then
			--reset_pos(player.Character.HumanoidRootPart)
		end
	end)
end

--even worse, completely break the game
if false then return end

local evil = {
	'TouchMe',
	'Handle'
}
local givers = {}
for _, v in pairs(workspace:GetDescendants()) do
	if v.Name == 'Givers' then
		table.insert(givers, v)
	end
end
spawn(function()
	while wait(5) do
		for _, giver in pairs(givers) do
			for _, basepart in pairs(giver:GetDescendants()) do
				if not basepart:IsA'BasePart' then continue end
				spawn(function()
					reset_pos(basepart)
				end)
			end
		end
	end
end)

local doing = false
game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
	if k == 'e' and not doing then
		local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
		doing = true
		local oldpos = hrp.CFrame
		hrp.CFrame = CFrame.new(0,0,0)
		wait(.5)
		hrp.CFrame = oldpos
		doing = false
	end
end)
