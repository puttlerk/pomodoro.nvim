M = {}

local SEC_PER_MIN = 60
local MIN_PER_HR  = 60
local SEC_PER_HR	= SEC_PER_MIN * MIN_PER_HR

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

M.convertTime = function (time)
	local hours, mins, secs

	if (time < SEC_PER_HR) then
		hours = 0
	else
		hours = time // SEC_PER_HR
	end
	local hourRemainder	= time - (hours * SEC_PER_HR)

	if (hourRemainder < SEC_PER_MIN) then
		mins = 0
	else
		mins = hourRemainder // SEC_PER_MIN
	end
	secs = hourRemainder - (mins * SEC_PER_MIN)

	return hours, mins, secs
end

M.displayTimer = function (endTime)
	local timeRemaining			= M.checkTimer(endTime)
	local hours, mins, secs = M.convertTime(timeRemaining)

	local timeStr = string.format('%02d:%02d:%02d', hours, mins, secs)
	print(timeStr)
end

local endTime = M.startTimer(15)
while (M.checkTimer(endTime) ~= 0) do
	M.displayTimer(endTime)
end

return M
