installation_dir = ~/.local/bin


## help: shows this message.
.PHONY: help
help: 
	@echo 'Usage'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'


## confirm: asks the user for confirmation.
.PHONY: confirm
confirm: 
	@echo -n 'Are you sure? [y/N] ' && read ans && [ $${ans:-N} = y ]

## install: installs the scripts in ~/.local/bin
install: 
	@[ -e ${installation_dir} ] || mkdir ${installation_dir}
	@echo "Installing scripts..."
	@cp -r ./src/* ${installation_dir} && echo "Installation complete. Scripts installed in ${installation_dir}"
