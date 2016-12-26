--
-- Nekrowebmod
--

-- Add this mod to trusted_mods
-- Open : minetest.confg
-- Add : secure.trusted_mods = requesthttpapi

local load_time_start = os.clock()

local http_api = minetest.request_http_api and minetest.request_http_api()


if http_api then
	local feed_url = "http://localhost:8080/api/v1/getrecord/1"
	local receive_interval = 10

	local function pcall_function(data)
        local contents = data.responseData[1]
        local text = contents.name
        minetest.chat_send_all("HRA: " .. text)
	end

	local function fetch_callback(result)
		if not result.completed then
			return
		end

        a = result.data
        b = string.gsub(a, "%[\"", "[")
        c = string.gsub(b, "\"%]", "]")
        data_json = string.gsub(c, "%'", "\"")

        pcall(pcall_function, minetest.parse_json( data_json ))
	end

	local function get_latest_tweet()
		local json_url = feed_url

		http_api.fetch({url = json_url, timeout = receive_interval}, fetch_callback)

		minetest.after(receive_interval, get_latest_tweet)
	end

	minetest.after(1, get_latest_tweet)
end


local time = math.floor(tonumber(os.clock()-load_time_start)*100+0.5)/100
local msg = "[Request Http API Tweeter] Loaded after ca. " .. time
if time > 0.05 then
	print(msg)
else
	minetest.log("info", msg)
end
