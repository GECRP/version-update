--GECRP Github Version Check

-- Returns the current version set in fxmanifest.lua
function GetCurrentVersion()
	return GetResourceMetadata( GetCurrentResourceName(), "version" )
end

PerformHttpRequest("https://raw.githubusercontent.com/GECRP/version-update/main/qb-pawnshop.txt", function( err, text, headers )
	-- Wait to reduce spam
	Citizen.Wait( 2000 )

	-- Get the current resource version
	local curVer = GetCurrentVersion()

	--print( "  ||    Current version: " .. curVer )

	if ( text ~= nil ) then
		-- Print latest version
		--print( "  ||    Latest recommended version: " .. text .."\n  ||" )

		-- If the versions are different, print it out
		if ( tonumber(text) ~= tonumber(curVer) ) then
            print( "  ||    Current version: " .. curVer )
            print( "  ||    Latest recommended version: " .. text .."\n  ||" )
			print( "  ||    ^1" .. string.upper(GetCurrentResourceName()) .. " IS OUTDATED. PULL THE NEW VERSION\n^0  \\\\\n" )
		end
	else
		-- In case the version can not be requested, print out an error message
		print( "  ||    ^1There was an error getting the latest version information.\n^0  ||\n  \\\\\n" )
	end
end )
