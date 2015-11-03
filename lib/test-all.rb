MAX_PARALLEL = 3 # Number of Casks to test in parallel. 3 seems reasonable
CASKS = `brew cask search`.split("\n").shift #Our wonderful list of Casks
		#List of all 	#Each line to[] #Remove 1st element (cask info message)
require 'thread/pool'


pool = Thread.pool(MAX_PARALLEL)
#Magic happens here
for cask in CASKS[0..10] do
	pool.process do
		install, install_res = `brew cask install #{cask}`, $?
		if install_res.exitstatus == 0 do
			#Install succeeded

			#Remove the cask
			uninstall, uninstall_res = `brew cask zap #{cask}`, $?

		else
			#Some error
			puts "error: Brew failed to install #{cask}"
		
		
	end
end