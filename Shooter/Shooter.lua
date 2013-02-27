local shooter = CreateFrame("Frame")

shooter:RegisterEvent("ACHIEVEMENT_EARNED")

function shooter:shoot(event, msg)
  if (event and event == "ACHIEVEMENT_EARNED") then
    wait(1)
    TakeScreenshot()
  end
end

shooter:SetScript("OnEvent", shooter.shoot)

function wait(seconds)
	local _start = time()
	local _end = _start+seconds
	while (_end ~= time()) do
	end
end