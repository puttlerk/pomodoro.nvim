M = {}

local SEC_PER_MIN <const> = 60
local MIN_PER_HR	<const> = 60

M.startTimer = function (min)
	return os.time() + (min * SEC_PER_MIN)
end

M.checkTimer = function (endTime)
	local timeRemaining = endTime - os.time()

	if (timeRemaining <= 0) then
		return 0
	else
		return timeRemaining
	end
end

return M
