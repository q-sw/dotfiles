#!/bin/bash

KUBE_PROMPT_CACHE="${HOME}/.kube/prompt_cache"

update_prompt_cache() {

    if ! command -v kubectl &>/dev/null; then
        return
    fi
    (
        local KUBECONFIG_FILE="${KUBECONFIG:-${HOME}/.kube/config}"
        echo KUBECONFIG_FILE

        if [[ ! -f ${KUBECONFIG_FILE} ]]; then
            echo "export KUBE_PROMPT_INFO=''" >"${KUBE_PROMPT_CACHE}"
            return
        fi

        if [[ ! -f ${KUBE_PROMPT_CACHE} || ${KUBECONFIG_FILE} -nt ${KUBE_PROMPT_CACHE} || -z $(cat "${KUBE_PROMPT_CACHE}" 2>/dev/null) ]]; then
            context=$(kubectl config current-context 2>/dev/null)
            if [[ -n ${context} ]]; then
                namespace=$(kubectl config view --minify -o "jsonpath={.contexts[?(@.name==\"${context}\")].context.namespace}" 2>/dev/null)
                echo "export KUBE_PROMPT_INFO=\"k8s:(${context}:${namespace:-default})\"" >"${KUBE_PROMPT_CACHE}"
            else
                echo "export KUBE_PROMPT_INFO=''" >"${KUBE_PROMPT_CACHE}"
            fi
        fi
    ) &>/dev/null
}
