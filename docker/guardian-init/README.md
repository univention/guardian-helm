# Guardian Init

This image solely exists to allow each Guardian component to bring their own
Keycloak client, just as it happens on the UCS AppCenter install scripts.

It allows the Guardian components from depending on being externally provisioned,
as well as providing a better status health representation on their Kubernetes
status.
