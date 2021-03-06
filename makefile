node_bin=./node_modules/.bin
dist_folder=./dist
public_folder=./public
src_folder=./src
jest_config_file=./jest.json
ts_config_file=./tsconfig.json
tsc_executable=${node_bin}/tsc
prettier_executable=${node_bin}/prettier
jest_executable=${node_bin}/jest

compile:
	rm -rf ${dist_folder}
	mkdir ${dist_folder}
	cp -r ${public_folder} ${dist_folder}
	make format
	${tsc_executable} -p ${ts_config_file}

format:
	${prettier_executable} \
	--no-semi \
	--trailing-comma "all" \
	--write "${src_folder}/**/*.ts"

test:
	${jest_executable} \
	--config=${jest_config_file} \
	--coverage \
	--watch

test-ci:
	${jest_executable} \
	--bail \
	--ci \
	--config=${jest_config_file} \
	--coverage \
	--runInBand \
	--verbose
