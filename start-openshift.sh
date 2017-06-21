systemctl daemon-reload
systemctl start openshift
chkconfig openshift on
export KUBECONFIG=/opt/openshift/openshift.local.config/master/admin.kubeconfig
export CURL_CA_BUNDLE=/opt/openshift/openshift.local.config/master/ca.crt
source /root/.bashrc
oc login -u system:admin
oadm policy add-scc-to-user hostnetwork -z router
oadm router
oadm registry

