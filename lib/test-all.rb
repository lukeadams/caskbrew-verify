MAX_PARALLEL = 3 # Number of Casks to test in parallel. 3 seems reasonable
CASKS = `brew cask search`.split("\n").shift #Our wonderful lsit of Casks


for CASKS[0..10] do |cask|
	`brew cask install #{cask}`
	`brew cask zap #{cask}`
	`brew cask cleanup`
end