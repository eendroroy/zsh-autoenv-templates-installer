#!/usr/bin/env zsh

function ati() {

	_TEMPLATE_NAMES=(JAVA PYTHON RUBY)

	if [[ ${_TEMPLATE_NAMES[(i)$1]} > $#_TEMPLATE_NAMES ]]; then
		(>&2 echo "Template for ${1} not available.")
		(>&2 echo "Availavle template are ${_TEMPLATE_NAMES}.")
		return 1
	fi

	[[ -z ${ATI_ENV_IN} ]]  && ATI_ENV_IN=.env.in
	[[ -z ${ATI_ENV_OUT} ]] && ATI_ENV_OUT=.env.out

	echo
	echo "  ---> Installing template for '${1}'"
	echo "       into '${ATI_ENV_IN}' and '${ATI_ENV_OUT}' ..."
	echo

	if [[ "${1}" == "JAVA" ]]; then
		wget https://github.com/eendroroy/autoenv-templates/raw/master/java/env.in -O ${ATI_ENV_IN} -q
		wget https://github.com/eendroroy/autoenv-templates/raw/master/java/env.out -O ${ATI_ENV_OUT} -q
	elif [[ "${1}" == "RUBY" ]]; then
		wget https://github.com/eendroroy/autoenv-templates/raw/master/ruby/env.in -O ${ATI_ENV_IN} -q
		wget https://github.com/eendroroy/autoenv-templates/raw/master/ruby/env.out -O ${ATI_ENV_OUT} -q
	elif [[ "${1}" == "PYTHON" ]]; then
		wget https://github.com/eendroroy/autoenv-templates/raw/master/python/env.in -O ${ATI_ENV_IN} -q
		wget https://github.com/eendroroy/autoenv-templates/raw/master/python/env.out -O ${ATI_ENV_OUT} -q
	fi

}