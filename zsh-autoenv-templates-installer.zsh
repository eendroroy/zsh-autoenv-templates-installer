#!/usr/bin/env zsh

function ati() {

	SCRIPT_ROOT=${0:A:h}
	source "${SCRIPT_ROOT}/autoenv-templates/__TEMPLATE_NAMES.zsh"

	if [[ ${__TEMPLATE_NAMES[(i)$1]} > $#__TEMPLATE_NAMES ]]; then
		(>&2 echo "Template for ${1} not available.")
		(>&2 echo "Availavle template are ${__TEMPLATE_NAMES}.")
		return 1
	fi

	[[ -z ${ATI_ENV_IN} ]]  && ATI_ENV_IN=.env.in
	[[ -z ${ATI_ENV_OUT} ]] && ATI_ENV_OUT=.env.out

	echo
	echo "  ---> Installing template for '${1}'"
	echo "       into '${ATI_ENV_IN}' and '${ATI_ENV_OUT}' ..."
	echo

	\cp "${SCRIPT_ROOT}/autoenv-templates/${1}/env.in" "${ATI_ENV_IN}"
	\cp "${SCRIPT_ROOT}/autoenv-templates/${1}/env.out" "${ATI_ENV_OUT}"

}