INSTALL_TOOLS += $(TOOLBIN)/yq
$(TOOLBIN)/yq:
	cd $(TOOLS_DIR); ./install_yq.sh

INSTALL_TOOLS += $(TOOLBIN)/helm
$(TOOLBIN)/helm:
	cd $(TOOLS_DIR); ./install_helm.sh

INSTALL_TOOLS += $(TOOLBIN)/kind
$(TOOLBIN)/kind:
	GOBIN=$(ABSTOOLBIN) go install sigs.k8s.io/kind@v0.11.1

INSTALL_TOOLS += $(TOOLBIN)/kubebuilder
$(TOOLBIN)/kubebuilder $(TOOLBIN)/etcd $(TOOLBIN)/kube-apiserver $(TOOLBIN)/kubectl:
	cd $(TOOLS_DIR); ./install_kubebuilder.sh

.PHONY: install-tools
install-tools: $(INSTALL_TOOLS)

.PHONY: uninstall-tools
uninstall-tools:
	rm -rf $(INSTALL_TOOLS)



