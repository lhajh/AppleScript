------------------------------------------------------------------------------# modAuth: suliveevil# originAuth: Christopher Stone# dCre: 2017/05/22 15:10# dMod: 2017/05/29 14:16# Appl: System Events# Task: Attempt to acquire the POSIX Path of the file associated with the front window of the front app.# Libs: None# Osax: None# Tags: @Applescript, @Script, @ASObjC, @System_Events, @Acquire, @POSIX_Path, @Path, @File, @Associated, @Front, @Window, @Front_App# Notes# fileName Regex: [^/]*$# folderPath = ------------------------------------------------------------------------------use framework "Foundation"use scripting additionstry		tell application "System Events"		set frontProcess to first process whose frontmost is true		set procName to name of frontProcess		tell frontProcess			tell front window				tell attribute "AXDocument"					set fileUrlOfFrontWindow to its value				end tell			end tell		end tell	end tell	on error	set fileUrlOfFrontWindow to missing valueend tryif fileUrlOfFrontWindow ≠ missing value and fileUrlOfFrontWindow ≠ "file:///Irrelevent" then	set posixPath to (current application's class "NSURL"'s URLWithString:fileUrlOfFrontWindow)'s |path|() as text	return posixPathelse	-- set posixPath to (current application's class "NSURL"'s URLWithString:fileUrlOfFrontWindow)'s |path|() as text	-- return posixPath	set theFile to POSIX path of (choose file)end if